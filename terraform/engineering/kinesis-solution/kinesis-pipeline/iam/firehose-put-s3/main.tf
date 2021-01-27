resource "aws_iam_policy" "cross-account-s3" {
  name        = "${var.stream_name}-cross-account-s3"
  description = "Allow firehose to put objects in another account s3 bucket"

  policy = <<EOF
{
    "Version": "2012-10-17",  
    "Statement":
    [    
        {      
            "Effect": "Allow",      
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
                "arn:aws:s3:::${var.bucket_name}",
                "arn:aws:s3:::${var.bucket_name}/*"		    
            ]    
        },        
        {
            "Effect": "Allow",
            "Action": [
                "kinesis:DescribeStream",
                "kinesis:GetShardIterator",
                "kinesis:GetRecords",
                "kinesis:ListShards"
            ],
            "Resource": [
              "arn:aws:kinesis:${var.region}:${var.eng-account-id}:stream/${var.stream_name}"
            ]
        },
        {
           "Effect": "Allow",
           "Action": [
               "kms:Decrypt",
               "kms:GenerateDataKey"
           ],
           "Resource": [
               "arn:aws:kms:${var.region}:${var.eng-account-id}:key/*"           
           ],
           "Condition": {
               "StringEquals": {
                   "kms:ViaService": "s3.${var.region}.amazonaws.com"
               },
               "StringLike": {
                   "kms:EncryptionContext:aws:s3:arn": "arn:aws:s3:::${var.bucket_name}/*"
               }
           }
        },
        {
           "Effect": "Allow",
           "Action": [
               "logs:PutLogEvents"
           ],
           "Resource": [
               "arn:aws:logs:${var.region}:${var.eng-account-id}:log-group:${var.log_group_name}:${var.log_stream_name}:*"
           ]
        },
        {
           "Effect": "Allow", 
           "Action": [
               "lambda:InvokeFunction", 
               "lambda:GetFunctionConfiguration" 
           ],
           "Resource": [
               "arn:aws:lambda:${var.region}:${var.eng-account-id}:function:*"
           ]
        }
    ]
}
EOF
}


resource "aws_iam_role" "cross-account-s3" {
  name               = "${var.stream_name}-cross-account-s3"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach-kinesis-s3_cross_account" {
  role       = aws_iam_role.cross-account-s3.name
  policy_arn = aws_iam_policy.cross-account-s3.arn
}
