variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "app_name" {
  type        = string
  description = "Base name for ECS resources"
  default     = "globusdev"
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

variable "acm_certificate_arn" {
  type        = string
  description = "ACM certificate ARN for HTTPS listener"
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
  default     = "app.globusdev.xyz"
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
