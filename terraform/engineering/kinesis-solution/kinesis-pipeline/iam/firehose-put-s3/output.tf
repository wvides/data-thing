output "cross_account_s3_arn" {
  description = "ARN of the account that will be used to forward with kinesis firehose the data to a different account"
  value       = aws_iam_role.cross-account-s3.arn
}
