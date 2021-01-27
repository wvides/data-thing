resource "aws_iam_policy" "put_records_policy" {
  name        = "${var.stream_name}-kinesis_streams_put_records"
  description = "A policy to allow the API gateway to put records on kinesis streams"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "kinesis:PutRecord",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role" "api_gateway-kinesis_put_records" {
  name     = "${var.stream_name}-api_gateway-kinesis_put_records"
  tags = {
    Project = "StreamsProcess"
  }
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "apigateway.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach-api_gw-kinesis-put" {
  role       = aws_iam_role.api_gateway-kinesis_put_records.name
  policy_arn = aws_iam_policy.put_records_policy.arn
}