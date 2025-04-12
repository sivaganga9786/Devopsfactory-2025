variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnet_cidrs" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}


variable "private_subnet_cidr" {}
variable "ec2_sg_name" {
  description = "The name of the EC2 security group"
  type        = string
}