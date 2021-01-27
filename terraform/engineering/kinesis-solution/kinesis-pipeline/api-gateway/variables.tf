variable "region" {
  type        = string
  description = "Region where the API Gateway will be spawned"
}

variable "api_gateway-name" {
  description = "Name that will be assigned to the API GW"
  type = string
}

variable "put_records_role_arn" {
  description = "A ARN of a role that allows API GW to put records in a Kinesis stream and api gateway to assume the role"
  type = string
}