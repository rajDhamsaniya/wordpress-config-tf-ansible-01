output "vpc-id" {
    value = aws_vpc.myvpc.id
}

output "private-subnet" {
    value = aws_subnet.myprivatesubnet[*].id
}

output "public-subnet" {
    value = aws_subnet.mypublicsubnet[*].id
}