provider "aws" {
  access_key = Access_Key
  secret_key = Secret_Key
  region     = var.region
}


provider "aws" {
  alias      = "temp"
  access_key = Access_Key
  secret_key = Secret_Key
  region     = "ap-south-1"
}

module "wordpress-VPC" {
  source      = "../VPCModule"
  cidr_block  = "172.16.0.0/16"
  environment = "dev"
  providers = {
    aws = aws.temp
  }
}

output "wordpress-vpc" {
  value = module.wordpress-VPC.vpc-id
}
