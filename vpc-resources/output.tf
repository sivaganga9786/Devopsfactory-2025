output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private.id
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}

# vpc_module/outputs.tf

output "ec2_instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = aws_instance.ec2_instance[*].id
}

output "ec2_public_ips" {
  description = "The public IP addresses of the EC2 instances"
  value       = aws_instance.ec2_instance[*].public_ip
}

