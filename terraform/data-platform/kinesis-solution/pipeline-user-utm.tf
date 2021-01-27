variable "user_utm_data_bucket_name" {
  type    = string
  default = "user-utm-data"
}

module "user_utm_iam" {
  source           = "./kinesis-pipeline/iam"
  data_bucket_name = var.user_utm_data_bucket_name
}

module "user_utm_crawlers" {
  source                        = "./kinesis-pipeline/glue-crawlers"
  s3_catalog_database_name      = "user_utm-crawled_bucket"
  s3_crawler_name               = "user_utm-s3-crawler"
  redshift_catalog_databse_name = "user_utm-crawled_redshift_table"
  redshift_crawler_name         = "user_utm-redshift_crawler"
  redshift_database             = "dev"
  schema                        = "tracking"
  table                         = "utm"
  data_bucket_name              = var.user_utm_data_bucket_name
  glue_crawler_arn              = module.user_utm_iam.glue_s3_crawler_arn
  glue_redshift_connection_name = var.redshift_connection_name
}