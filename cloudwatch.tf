resource "aws_cloudwatch_log_group" "datasync-task" {
  provider = aws.source-profile-destination-region
  name = "datasync-task"
}
