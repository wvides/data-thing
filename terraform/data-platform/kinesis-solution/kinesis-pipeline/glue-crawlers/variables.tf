variable "glue_redshift_connection_name" {
  type = string
  default = "redshift-dwh"
  description = "The name of the glue redshift connection that will be used for the database crawler"
}

variable "s3_catalog_database_name" {
  type = string
  description = "Name for the database that will be used by the s3 crawler"
}

variable "s3_crawler_name" {
  type = string
  description = "Name for the s3 bucket crawler"
}

variable "redshift_catalog_databse_name" {
  type = string
  description = "Name for the catalog database that the glue crawler will use for to store the discovered redshift database schema"
}

variable "redshift_crawler_name" {
  type = string
  description = "Name for the redshift schema crawler"
}

variable "redshift_database" {
  type = string
  description = "The name of the database in redshift where you want the data to be stored"
}

variable "schema" {
  type = string
  description = "The schema name of the redshift database where the data will be stored"
}

variable "table" {
  type = string
  description = "The table name of the redshift database where the data will be stored"
}

variable "data_bucket_name" {
  type = string
  description = "Name of the bucket that the s3_crawler will crawl"
}

variable "glue_crawler_arn" {
  type = string
  description = "ARN of the IAM role that will be used to crawl the s3 bucket"
}