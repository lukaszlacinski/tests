variable "aws_region" {
  type        = string
  description = "AWS region for the state bucket"
  default     = "us-east-2"
}

variable "app_name" {
  type        = string
  description = "Project name"
  default     = "globus"
}

variable "name_prefix" {
  type        = string
  description = "Resource name prefix"
  default     = ""
}

variable "state_bucket_name" {
  type        = string
  description = "Single S3 bucket name for all environments' state"
  default     = "globus-tfstate"
}

variable "create_github_oidc_provider" {
  type        = bool
  description = "Create the GitHub OIDC provider (set false if it already exists)"
  default     = false
}
