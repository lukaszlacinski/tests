variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-2"
}

variable "app_name" {
  type        = string
  description = "Base name for ECS resources"
  default     = "globus"
}

variable "environment" {
  type        = string
  description = "Environment name (dev, staging, prod)"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "name_prefix" {
  type        = string
  description = "Resource name prefix (<project>-<environment>)"
  default     = ""
}

variable "container_name" {
  type        = string
  description = "Container name in task definition"
  default     = "app"
}

variable "container_port" {
  type        = number
  description = "Container port"
  default     = 8000
}

variable "desired_count" {
  type        = number
  description = "ECS desired task count"
  default     = 1
}

variable "task_cpu" {
  type        = number
  description = "Fargate task CPU units"
  default     = 256
}

variable "task_memory" {
  type        = number
  description = "Fargate task memory (MiB)"
  default     = 512
}

variable "vpc_id" {
  type        = string
  description = "VPC ID (defaults to default VPC)"
  default     = null
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs for ALB/ECS (defaults to subnets in default VPC)"
  default     = null
}

variable "route53_zone_id" {
  type        = string
  description = "Route53 hosted zone ID for app DNS (optional)"
  default     = null
}

variable "app_domain_name" {
  type        = string
  description = "DNS name for the app (optional)"
  default     = null
}

variable "allowed_hosts" {
  type        = string
  description = "ALLOWED_HOSTS value for Django"
  default     = null
}

variable "debug" {
  type        = string
  description = "DEBUG env var for Django"
  default     = "False"
}

variable "secret_arns" {
  type        = list(string)
  description = "Secrets Manager ARNs to allow ecsTaskExecutionRole to read"
  default     = []
}

variable "acm_certificate_arn" {
  type        = string
  description = "ACM certificate ARN in us-east-1 for CloudFront (required when using a custom domain)"
  default     = null
}

variable "github_repo" {
  type        = string
  description = "GitHub repo in the form owner/name"
  default     = "lukaszlacinski/tests"
}

variable "github_branch" {
  type        = string
  description = "GitHub branch allowed to assume the role"
  default     = "main"
}

variable "create_github_oidc_provider" {
  type        = bool
  description = "Create the GitHub OIDC provider (set false if it already exists)"
  default     = false
}
