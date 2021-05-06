resource "aws_internet_gateway" "myinternetgateway" {
  vpc_id = aws_vpc.myvpc.id
  tags   = merge(local.common_tags, { "Name" = var.igw_name })
}