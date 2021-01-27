resource "aws_kinesis_stream" "kinesis_stream" {
  name             = var.stream_name
  shard_count      = var.shard_count
  retention_period = var.retention_period

  shard_level_metrics = [
    "IncomingBytes",
    "IncomingRecords",
    "OutgoingBytes",
  ]
}