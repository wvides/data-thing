module "api_gw_put_kinesis_role" {
  source      = "./kinesis-pipeline/iam/api-gw-put-kinesis"
  stream_name = "user-events"
}

module "api_gw_proxy" {
  api_gateway-name     = "kinesis-proxy-api"
  source               = "./kinesis-pipeline/api-gateway"
  region               = var.region
  put_records_role_arn = module.api_gw_put_kinesis_role.api_gateway_kinesis_put_records_role_arn
}