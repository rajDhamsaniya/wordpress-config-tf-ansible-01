resource "aws_route_table" "mypublicroutetable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myinternetgateway.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.myinternetgateway.id
  }
}

resource "aws_route_table" "myprivateroutetable" {
  vpc_id = aws_vpc.myvpc.id
}

# resource "aws_route" "myprivateroute" {
#   route_table_id = aws_route_table.myprivateroutetable.id
# }
