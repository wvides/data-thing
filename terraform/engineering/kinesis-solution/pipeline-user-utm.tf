variable "user_utm_data_bucket_name" {
  type    = string
  default = "user-utm-data"
}

variable "user_utm-stream_name" {
  type    = string
  default = "user-utm"
}

module "user_utm_s3_bucket" {
  source                 = "./kinesis-pipeline/s3"
  region                 = var.region
  data_origin_account_id = var.eng-account-id
  data_bucket_name       = var.user_utm_data_bucket_name
  stream_name            = var.user_utm-stream_name
  cross_account_role_arn = var.cross_account_role_arn
}

module "user_utm-cloudwatch_logs" {
  source      = "./kinesis-pipeline/cloudwatch"
  stream_name = var.user_utm-stream_name
}

module "user_utm-iam_roles" {
  source          = "./kinesis-pipeline/iam/firehose-put-s3"
  bucket_name     = var.user_utm_data_bucket_name
  region          = var.region
  eng-account-id  = var.eng-account-id
  log_group_name  = module.user_utm-cloudwatch_logs.log_group_name
  log_stream_name = module.user_utm-cloudwatch_logs.log_stream_name
  stream_name     = var.user_utm-stream_name
}

module "user_utm-kinesis" {
  source              = "./kinesis-pipeline/kinesis"
  stream_name         = var.user_utm-stream_name
  aws_role_arn        = module.user_utm-iam_roles.cross_account_s3_arn
  bucket_destiny_name = var.user_utm_data_bucket_name
  log_group_name      = module.user_utm-cloudwatch_logs.log_group_name
  log_stream_name     = module.user_utm-cloudwatch_logs.log_stream_name
  shard_count         = 1
  retention_period    = 24
}