variable "aws_region" {
  type        = string
  description = "AWS region for the state bucket"
  default     = "us-east-2"
}

variable "name_prefix" {
  type        = string
  description = "Resource name prefix"
  default     = "globus-dev"
}
