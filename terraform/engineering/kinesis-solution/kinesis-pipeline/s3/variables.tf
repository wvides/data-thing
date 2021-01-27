variable "data_origin_account_id" {
  type        = string
  description = "The AWS account id of the data origing, this can be retrieved from the AWS console under the support section"
}

variable "data_bucket_name" {
  type        = string
  description = "The name of the bucket where the data will be stored"
}

variable "stream_name" {
  type = string
}

variable "region" {
  type = string
}

variable "cross_account_role_arn" {
  type = string
  description = "An ARN of an account that allows AWS account engineering to assume a role in AWS account data-platform"
}