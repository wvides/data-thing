resource "aws_api_gateway_rest_api" "kinesis-proxy-api" {
  name        = var.api_gateway-name
  description = "An api gateway to forward recrods to kinesis streams"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "kinesis-proxy-api-streams-path" {
  rest_api_id = aws_api_gateway_rest_api.kinesis-proxy-api.id
  parent_id   = aws_api_gateway_rest_api.kinesis-proxy-api.root_resource_id
  path_part   = "streams"
}

resource "aws_api_gateway_resource" "kinesis-proxy-api-stream_name-path" {
  rest_api_id = aws_api_gateway_rest_api.kinesis-proxy-api.id
  parent_id   = aws_api_gateway_resource.kinesis-proxy-api-streams-path.id
  path_part   = "{stream-name}"
}

resource "aws_api_gateway_resource" "kinesis-proxy-api-record-path" {
  rest_api_id = aws_api_gateway_rest_api.kinesis-proxy-api.id
  parent_id   = aws_api_gateway_resource.kinesis-proxy-api-stream_name-path.id
  path_part   = "record"
}

resource "aws_api_gateway_method" "kinesis-proxy-api-record-path-PUT" {
  rest_api_id   = aws_api_gateway_rest_api.kinesis-proxy-api.id
  resource_id   = aws_api_gateway_resource.kinesis-proxy-api-record-path.id
  http_method   = "PUT"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "kinesis-proxy-api-record-path-PUT-response_200" {
  rest_api_id = aws_api_gateway_rest_api.kinesis-proxy-api.id
  resource_id = aws_api_gateway_resource.kinesis-proxy-api-record-path.id
  http_method = aws_api_gateway_method.kinesis-proxy-api-record-path-PUT.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration" "kinesis-proxy-api-record-integration" {
  rest_api_id             = aws_api_gateway_rest_api.kinesis-proxy-api.id
  resource_id             = aws_api_gateway_resource.kinesis-proxy-api-record-path.id
  integration_http_method = "POST"
  http_method             = aws_api_gateway_method.kinesis-proxy-api-record-path-PUT.http_method
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.region}:kinesis:action/PutRecord"
  credentials             = var.put_records_role_arn
  request_parameters = {
    "integration.request.header.Content-Type" = "'x-amz-json-1.1'"
  }

  request_templates = {
    "application/json" = <<EOF
{
    "StreamName": "$input.params('stream-name')",
    "Data": "$util.base64Encode($input.json('$.Data'))",
    "PartitionKey": "$input.path('$.PartitionKey')"
}
EOF
  }
}

resource "aws_api_gateway_integration_response" "kinesis-proxy-api-record-path-PUT-integration-response" {
  depends_on = [
    aws_api_gateway_integration.kinesis-proxy-api-record-integration
  ]
  rest_api_id = aws_api_gateway_rest_api.kinesis-proxy-api.id
  resource_id = aws_api_gateway_resource.kinesis-proxy-api-record-path.id
  http_method = aws_api_gateway_method.kinesis-proxy-api-record-path-PUT.http_method
  status_code = aws_api_gateway_method_response.kinesis-proxy-api-record-path-PUT-response_200.status_code

  response_templates = {
    "application/json" = ""
  }
}

resource "aws_api_gateway_deployment" "kinesis-proxy-api-deployment" {
  depends_on = [
    aws_api_gateway_integration.kinesis-proxy-api-record-integration,
    aws_api_gateway_integration_response.kinesis-proxy-api-record-path-PUT-integration-response
  ]

  rest_api_id = aws_api_gateway_rest_api.kinesis-proxy-api.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_cloudwatch_log_group" "kinesis-proxy-api" {
  name = "/aws/apigateway/kinesis-proxy-api"
}

resource "aws_api_gateway_stage" "prod" {
  stage_name    = "prod"
  rest_api_id   = aws_api_gateway_rest_api.kinesis-proxy-api.id
  deployment_id = aws_api_gateway_deployment.kinesis-proxy-api-deployment.id

  access_log_settings {
    format          = <<EOF
{ "requestId":"$context.requestId", "ip": "$context.identity.sourceIp", "caller":"$context.identity.caller", "user":"$context.identity.user", "requestTime":"$context.requestTime", "httpMethod":"$context.httpMethod", "resourcePath":"$context.resourcePath", "status":"$context.status", "protocol":"$context.protocol", "responseLength":"$context.responseLength" \}
EOF
    destination_arn = aws_cloudwatch_log_group.kinesis-proxy-api.arn
  }
}