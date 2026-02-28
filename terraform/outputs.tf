output "ecr_repository_url" {
  value       = aws_ecr_repository.app.repository_url
  description = "ECR repository URL"
}

output "ecs_cluster_name" {
  value       = aws_ecs_cluster.app.name
  description = "ECS cluster name"
}

output "ecs_service_name" {
  value       = aws_ecs_service.app.name
  description = "ECS service name"
}

output "alb_dns_name" {
  value       = aws_lb.app.dns_name
  description = "ALB DNS name"
}

output "cloudfront_domain_name" {
  value       = aws_cloudfront_distribution.app.domain_name
  description = "CloudFront domain name"
}

output "github_actions_role_arn" {
  value       = aws_iam_role.github_actions.arn
  description = "IAM role ARN for GitHub Actions OIDC"
}
