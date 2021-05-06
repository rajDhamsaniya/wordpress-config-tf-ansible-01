data "aws_ami" "ubuntu-amis" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
    filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "wp-ec2" {
    instance_type = "t2.micro"
    subnet_id = element(module.wordpress-VPC.public-subnet, count.index)
    count = 1
    ami = data.aws_ami.ubuntu-amis.image_id
    key_name = aws_key_pair.login_key.key_name
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    provisioner "local-exec" {
        command = "sleep 120; cd ../playbook-demo; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${aws_instance.wp-ec2[0].public_ip},' ping.yml -vvv"
    }
}