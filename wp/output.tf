output "pubip" {
    value = aws_instance.wp-ec2[*].public_ip
}