variable "region" {
  default = "us-east-1"
}
variable "access_key" {
  default = "us-east-1"
}
variable "secret_key" {
  default = "us-east-1"
}

variable "volume_size" {
  default = 8
}

variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}

variable "key_name" {}
variable "public_key_path" {}

variable "instances" {
  type = list(object({
    name          = string
    ami           = string
    instance_type = string
    role          = string
  }))
}
variable "private_subnet_cidr" {}
variable "ec2_sg_name" {
  description = "The name of the EC2 security group"
  type        = string
}



