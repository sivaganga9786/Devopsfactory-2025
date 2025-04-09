ami               = "ami-084568db4383264d4" #"ami-08d8ac128e0a1b91c" ami-084568db4383264d4
ec2_sg_name       = "ec2_sg"
ec2_instance_name = "trivy_server"
instance_type     = "t3.micro"
instance_count      = "1"
region              = "us-east-1"
vpc_cidr_block      = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"

public_route_table  = "public-route-table"
private_subnet      = "private-subnet"
public_subnet       = "public-subnet"
igw                 = "igw"
vpc_name            = "VPC"



