variable "stream_name" {
  type = string
}

variable "aws_role_arn" {
  description = "The arn value of a role that allows a kinesis firehose to put objects in the destination bucket"
  type = string
}

variable "bucket_destiny_name" {
  description = "Name of the destination bucket for the objects published by firehose"
  type = string
}

variable "log_group_name" {
  type = string
}

variable "log_stream_name" {
  type = string
}

variable "shard_count" {
  description = "Number of shards for the stream"
  type = number
}

variable "retention_period" {
  description = "The retention period in hours of the data published to the kinesis stream"
  type = number
}