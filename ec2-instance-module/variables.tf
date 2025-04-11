variable "vpc_cidr_block" {}
variable "public_subnet_cidr" {}
variable "private_subnet_cidr" {}
variable "vpc_name" {}
#variable "vpc_id" {} # This should be output if it's being referenced
variable "ami" {}
variable "instance_type" {}
#variable "subnet_id" {}
variable "ec2_instance_name" {}
variable "ec2_sg_name" {}
variable "instance_count" {}
variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable "public_subnet" {}
variable "igw" {}
variable "public_route_table" {}
variable "private_subnet" {}
variable "user_data" {
  type    = string
  default = "" # Empty string or some default user data script
}
variable "availability_zone" {
  description = "The availability zone to launch the instance in"
  default     = "ap-south-1a"  # Set default to a supported zone
}
variable "ec2_instances" {
  description = "Map of EC2 instance names to startup scripts"
  type = map(string)
  default = {
    "jenkins-instance"  = "jenkins.sh"
    "sonarqube-instance" = "sonarqube.sh"
    "trivy-instance"     = "trivy.sh"
  }
}

#variable "AWS_ACCESS_KEY_ID" {}
#variable "AWS_SECRET_ACCESS_KEY" {}