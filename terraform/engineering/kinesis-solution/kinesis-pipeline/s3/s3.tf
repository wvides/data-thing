resource "aws_s3_bucket" "pipeline_bucket_data" {
  provider = aws.data-platform
  bucket   = var.data_bucket_name
  acl      = "private"
}

resource "aws_s3_bucket_policy" "cross-account-s3-policy" {
  provider = aws.data-platform
  bucket   = aws_s3_bucket.pipeline_bucket_data.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Principal": {
              "AWS": "arn:aws:iam::${var.data_origin_account_id}:role/${var.stream_name}-cross-account-s3"
          },
          "Action": [
              "s3:AbortMultipartUpload",
              "s3:GetBucketLocation",
              "s3:GetObject",
              "s3:ListBucket",
              "s3:ListBucketMultipartUploads",
              "s3:PutObject",
              "s3:PutObjectAcl"
          ],
          "Resource": [
              "arn:aws:s3:::${var.data_bucket_name}",
              "arn:aws:s3:::${var.data_bucket_name}/*"
          ]
      }
  ]
}
EOF
}