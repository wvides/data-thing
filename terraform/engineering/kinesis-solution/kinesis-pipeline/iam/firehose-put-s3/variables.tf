variable "bucket_name" {
  description = "Name of the bucket where the stream data will be stored"
  type        = string
}

variable "region" {
  type = string
}

variable "eng-account-id" {
  description = "Name of the origing account id, in this case the engineering account id, this value can be obtained under the support section of the AWS console"
  type        = string
}

variable "log_group_name" {
  type = string
}

variable "log_stream_name" {
  type = string
}

variable "stream_name" {
  description = "Name of the stream, it is better to name this variable the same as the bucket"
  type        = string
}