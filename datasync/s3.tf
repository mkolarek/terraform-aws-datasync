data "aws_s3_bucket" "source" {
  provider = aws.source-profile-source-region
  bucket   = var.source_bucket
}

data "aws_s3_bucket" "destination" {
  provider = aws.destination-profile-destination-region
  bucket   = var.destination_bucket
}

resource "aws_s3_bucket_policy" "destination_bucket_policy" {
  provider = aws.destination-profile-destination-region
  bucket   = data.aws_s3_bucket.destination.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DataSyncCreateS3LocationAndTaskAccess"
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_role.datasync-role.arn
        }
        Action = [
          "s3:GetBucketLocation",
          "s3:ListBucket",
          "s3:ListBucketMultipartUploads",
          "s3:AbortMultipartUpload",
          "s3:DeleteObject",
          "s3:GetObject",
          "s3:ListMultipartUploadParts",
          "s3:PutObject",
          "s3:GetObjectTagging",
          "s3:PutObjectTagging"
        ]
        Resource = [
          data.aws_s3_bucket.destination.arn,
          "${data.aws_s3_bucket.destination.arn}/*"

        ]
      }
    ]
  })
}
