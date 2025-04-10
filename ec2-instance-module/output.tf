#output "ec2_instance_id" {
#  description = "The ID of the EC2 instance"
#  value       = module.ec2.instance_id
#}









output "vpc_id" {
  value = module.vpc_module.vpc_id
}

output "public_subnet_id" {
  value = module.vpc_module.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc_module.private_subnet_id
}

output "igw_id" {
  value = module.vpc_module.igw_id
}



# outputs.tf in the root module

output "ec2_instance_ids" {
  description = "The IDs of the EC2 instances from the module"
  value       = module.vpc_module.ec2_instance_ids
}

output "ec2_public_ips" {
  description = "The public IP addresses of the EC2 instances from the module"
  value       = module.vpc_module.ec2_public_ips
}
