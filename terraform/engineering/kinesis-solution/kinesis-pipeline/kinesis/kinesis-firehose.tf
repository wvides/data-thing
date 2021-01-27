resource "aws_kinesis_firehose_delivery_stream" "firehose_stream" {
  name        = var.stream_name
  destination = "extended_s3"

  kinesis_source_configuration {
    kinesis_stream_arn = aws_kinesis_stream.kinesis_stream.arn
    role_arn           = var.aws_role_arn
  }

  extended_s3_configuration {
    role_arn   = var.aws_role_arn
    bucket_arn = "arn:aws:s3:::${var.bucket_destiny_name}"

    cloudwatch_logging_options {
      enabled         = true
      log_group_name  = var.log_group_name
      log_stream_name = var.log_stream_name
    }
  }
}