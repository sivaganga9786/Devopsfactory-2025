# Security Group for EC2 Instance
resource "aws_security_group" "ec2_sg" {
  vpc_id      = var.vpc_id

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

resource "aws_instance" "ec2" {
  count         = length(var.instances)
  ami           = var.instances[count.index].ami
  instance_type = var.instances[count.index].instance_type
  subnet_id     = var.subnet_id
  associate_public_ip_address = true
  user_data     = element(var.user_data, count.index)
  security_groups        = [aws_security_group.ec2_sg.id]
  key_name      = var.key_name

  tags = {
    Name = var.instances[count.index].name
  }
}
