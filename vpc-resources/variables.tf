variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
}

variable "ec2_sg_name" {
  description = "The name of the EC2 security group"
  type        = string
}

variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "ec2_instance_name" {
  description = "The base name for the EC2 instances"
  type        = string
}


variable "user_data" {
  type    = string
  default = ""  # Empty string or some default user data script
}



variable "key_name" {
  description = "Name of the SSH key pair"
  default = "terraform_keypair"
}




