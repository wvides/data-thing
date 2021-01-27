output "rest_api-invoke_url" {
  description = "The URL at which the API GW that serves as kinesis streams reverse proxy can be invoked"
  value = "${aws_api_gateway_deployment.kinesis-proxy-api-deployment.invoke_url}${aws_api_gateway_stage.prod.stage_name}${aws_api_gateway_resource.kinesis-proxy-api-record-path.path}"
}