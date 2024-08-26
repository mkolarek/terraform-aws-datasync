resource "aws_datasync_location_s3" "source-location" {
  provider      = aws.source-profile-source-region
  s3_bucket_arn = data.aws_s3_bucket.source.arn
  subdirectory  = "/"

  s3_config {
    bucket_access_role_arn = aws_iam_role.datasync-role.arn
  }
}

resource "aws_datasync_location_s3" "destination-location" {
  provider      = aws.source-profile-destination-region
  s3_bucket_arn = data.aws_s3_bucket.destination.arn
  subdirectory  = "/"

  s3_config {
    bucket_access_role_arn = aws_iam_role.datasync-role.arn
  }
}

resource "aws_datasync_task" "mongodb" {
  provider                 = aws.source-profile-destination-region
  destination_location_arn = aws_datasync_location_s3.destination-location.arn
  name                     = "migrate-${var.source_bucket}"
  source_location_arn      = aws_datasync_location_s3.source-location.arn
  cloudwatch_log_group_arn = aws_cloudwatch_log_group.datasync-task.arn

  options {
    gid               = "NONE"
    uid               = "NONE"
    posix_permissions = "NONE"
    log_level         = "BASIC"
  }
}

resource "aws_iam_role" "datasync-role" {
  provider = aws.source-profile-source-region
  name     = "ds-${var.source_bucket}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "datasync.amazonaws.com"
        }
      },
    ]
  })
  inline_policy {
    name = "source_bucket_access"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "s3:GetBucketLocation",
            "s3:ListBucket",
            "s3:ListBucketMultipartUploads"
          ]
          Effect   = "Allow"
          Resource = data.aws_s3_bucket.source.arn
        },
        {
          Action = [
            "s3:AbortMultipartUpload",
            "s3:DeleteObject",
            "s3:GetObject",
            "s3:ListMultipartUploadParts",
            "s3:PutObject",
            "s3:GetObjectTagging",
            "s3:PutObjectTagging"
          ]
          Effect   = "Allow"
          Resource = "${data.aws_s3_bucket.source.arn}/*"
        },
      ]
    })
  }
  inline_policy {
    name = "destination_bucket_access"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = [
            "s3:GetBucketLocation",
            "s3:ListBucket",
            "s3:ListBucketMultipartUploads"
          ]
          Effect   = "Allow"
          Resource = data.aws_s3_bucket.destination.arn
        },
        {
          Action = [
            "s3:AbortMultipartUpload",
            "s3:DeleteObject",
            "s3:GetObject",
            "s3:GetObjectTagging",
            "s3:GetObjectVersion",
            "s3:GetObjectVersionTagging",
            "s3:ListMultipartUploadParts",
            "s3:PutObject",
            "s3:PutObjectTagging"
          ]
          Effect   = "Allow"
          Resource = "${data.aws_s3_bucket.destination.arn}/*"
        },
      ]
    })
  }
}
