resource "aws_vpc" "myvpc" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = merge(local.common_tags, { "Name" = var.vpc_name })
}