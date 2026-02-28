provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

locals {
  vpc_id            = coalesce(var.vpc_id, data.aws_vpc.default.id)
  public_subnet_ids = coalescelist(var.public_subnet_ids, data.aws_subnets.default.ids)
  name_prefix       = length(trimspace(var.name_prefix)) > 0 ? var.name_prefix : "${var.app_name}-${var.environment}"
  log_group_name    = "/ecs/${local.name_prefix}"
}
