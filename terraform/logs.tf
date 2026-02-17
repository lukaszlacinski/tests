resource "aws_cloudwatch_log_group" "app" {
  name              = local.log_group_name
  retention_in_days = 14
}
