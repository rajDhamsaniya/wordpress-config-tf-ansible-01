variable "region" {
  type        = string
  description = "Region of the providers"
  default = "ap-south-1"
}

variable "cidr_block" {
  type        = string
  description = "VPC cidr block range"
}

variable "environment" {
  type        = string
  description = "Name of environment"
}

variable "vpc_name" {
  type        = string
  description = "Optional name for VPC"
  default     = "custom-vpc"
}

variable "subnet_name" {
  type        = string
  description = "Optional name for VPC"
  default     = "custom-subnet"
}

variable "igw_name" {
  type        = string
  description = "InterNet Gateway Name"
  default     = "custom-igw"
}

variable "subnet_count" {
  type = number
  description = "Number of subnet in a vpc"
  default = 4
}

variable "public_subnet_count" {
  type = number
  description = "Number of public subnet"
  default = 2
}

variable "private_subnet_count" {
  type = number
  description = "Number of private subnet"
  default = 2
}