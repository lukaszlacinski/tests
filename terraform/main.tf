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
  log_group_name    = "/ecs/${var.app_name}"
}
