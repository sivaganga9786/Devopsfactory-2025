resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# Define Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}

# Define Private Subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
  availability_zone       = "us-east-1a"
  tags = {
    Name = "${var.vpc_name}-private-subnet"
  }
}

# Define Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# Define Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-route-table"
  }
}

# Associate Public Subnet with Route Table
resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Security Group for EC2 Instance
resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open SSH access to the world (consider restricting this for security)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.ec2_sg_name
  }
}

# EC2 Instance Creation
resource "aws_instance" "ec2_instance" {
  ami                    = var.ami
  count                  = var.instance_count 
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id  # Ensure this is a public subnet
  security_groups        = [aws_security_group.ec2_sg.id]
 # key_name               = aws_key_pair.key_pair.key_name
  key_name               = "terraform_keypai"
  associate_public_ip_address = true  # This is crucial for public IP assignment
  user_data = var.user_data
  tags = {
    Name = "${var.ec2_instance_name}-${count.index + 1}"
  }
}

// To Generate Private Key
// resource "tls_private_key" "rsa_4096" {
//  algorithm = "RSA"
//  rsa_bits  = 4096
//}

// Create Key Pair for Connecting EC2 via SSH
//resource "aws_key_pair" "key_pair" {
//  key_name   = var.key_name
//  public_key = tls_private_key.rsa_4096.public_key_openssh
//}

// Save PEM file locally
//resource "local_file" "private_key" {
//  content  = tls_private_key.rsa_4096.private_key_pem
//  filename = var.key_name
//}