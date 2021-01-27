variable "user_events_data_bucket_name" {
  type    = string
  default = "user-events-data"
}

module "user_events_iam" {
  source           = "./kinesis-pipeline/iam"
  data_bucket_name = var.user_events_data_bucket_name
}

module "user_events_crawlers" {
  source                        = "./kinesis-pipeline/glue-crawlers"
  s3_catalog_database_name      = "user_events-crawled_bucket"
  s3_crawler_name               = "user_events-s3-crawler"
  redshift_catalog_databse_name = "user_events-crawled_redshift_table"
  redshift_crawler_name         = "user_events-redshift_crawler"
  redshift_database             = "dev"
  schema                        = "tracking"
  table                         = "events"
  data_bucket_name              = var.user_events_data_bucket_name
  glue_crawler_arn              = module.user_events_iam.glue_s3_crawler_arn
  glue_redshift_connection_name = var.redshift_connection_name
}