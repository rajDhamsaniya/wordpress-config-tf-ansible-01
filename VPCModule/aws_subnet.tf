data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "mypublicsubnet" {
  cidr_block        = cidrsubnet(var.cidr_block, 8, (count.index+1))
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  count             = var.public_subnet_count
  map_public_ip_on_launch = true
  tags              = merge(local.common_tags, { "Name" = "${var.subnet_name}.${var.vpc_name}" })

}

resource "aws_subnet" "myprivatesubnet" {
  cidr_block        = cidrsubnet(var.cidr_block, 8, (count.index+129))
  vpc_id            = aws_vpc.myvpc.id
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  count             = var.private_subnet_count
  tags              = merge(local.common_tags, { "Name" = "${var.subnet_name}.${var.vpc_name}" })

}