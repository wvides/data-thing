resource "aws_glue_classifier" "s3-data-classifier-crawler" {
  name = "${var.data_bucket_name}-s3-data-classifier-crawler"

  json_classifier {
    json_path = "$.request_id"
  }
}

resource "aws_glue_catalog_database" "s3_catalog_database" {
  name = var.s3_catalog_database_name
}

resource "aws_glue_crawler" "user_events-s3_crawler" {
  database_name = aws_glue_catalog_database.s3_catalog_database.name
  name          = var.s3_crawler_name
  role          = var.glue_crawler_arn

  s3_target {
    path = "s3://${var.data_bucket_name}"
  }
}

resource "aws_glue_catalog_database" "redshift_catalog_database" {
  name = var.redshift_catalog_databse_name
}

resource "aws_glue_crawler" "user_events-redshift_crawler" {
  database_name = aws_glue_catalog_database.redshift_catalog_database.name
  name          = var.redshift_crawler_name
  role          = var.glue_crawler_arn

  jdbc_target {
    connection_name = var.glue_redshift_connection_name
    path            = "${var.redshift_database}/${var.schema}/${var.table}"
  }
}