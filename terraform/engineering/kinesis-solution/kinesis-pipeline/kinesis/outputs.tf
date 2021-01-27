output "stream_user_event-retention_period" {
  value = aws_kinesis_stream.kinesis_stream.retention_period
}

output "stream_user_event-shard_count" {
  value = aws_kinesis_stream.kinesis_stream.shard_count
}

output "stream_user_event-arn" {
  value = aws_kinesis_stream.kinesis_stream.arn
}