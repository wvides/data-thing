resource "aws_cloudwatch_log_group" "log-group" {
  name = "/aws/kinesisfirehose/${var.stream_name}-cross-account-stream"
}

resource "aws_cloudwatch_log_stream" "log-stream" {
  name           = "${var.stream_name}-S3Delivery"
  log_group_name = aws_cloudwatch_log_group.log-group.name
}