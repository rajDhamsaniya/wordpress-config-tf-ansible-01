resource "aws_route_table_association" "mypublicrouteassociation" {
  subnet_id      = aws_subnet.mypublicsubnet[count.index].id
  route_table_id = aws_route_table.mypublicroutetable.id
  count          = var.public_subnet_count
}

resource "aws_route_table_association" "myprivaterouteassociation" {
  subnet_id      = aws_subnet.myprivatesubnet[count.index].id
  route_table_id = aws_route_table.myprivateroutetable.id
  count          = var.private_subnet_count
}
