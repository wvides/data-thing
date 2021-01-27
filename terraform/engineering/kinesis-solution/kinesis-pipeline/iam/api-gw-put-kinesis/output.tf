output "api_gateway_kinesis_put_records_role_arn" {
  description = "ARN of a role that would allow API GW to put records on a kinesis stream and API GW to assume the role"
  value = aws_iam_role.api_gateway-kinesis_put_records.arn
}