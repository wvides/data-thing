data "aws_iam_policy" "aws-glue-service-role" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_policy" "s3-get-put-objects" {
  name = "${var.data_bucket_name}-s3-get-put-objects"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": [
                "arn:aws:s3:::${var.data_bucket_name}*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_role" "glue-s3-crawler" {
  name = "${var.data_bucket_name}-glue-s3-crawler"
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
        "Service": "glue.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach-glue-service-role" {
  depends_on = [
    aws_iam_role.glue-s3-crawler
  ]
  role       = aws_iam_role.glue-s3-crawler.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

resource "aws_iam_role_policy_attachment" "attach-s3-get-put-object" {
  role       = aws_iam_role.glue-s3-crawler.name
  policy_arn = aws_iam_policy.s3-get-put-objects.arn
}