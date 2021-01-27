variable "eng-account-id" {
  description = "The AWS account id of the data origing, this can be retrieved from the AWS console under the support section"
  type = string
}

variable "region" {
  type = string
}

variable "cross_account_role_arn" {
  description = "An ARN of an account that allows AWS account engineering to assume a role in AWS account data-platform"
  type = string
}