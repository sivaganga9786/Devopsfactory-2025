#output "ec2_instance_id" {
#  description = "The ID of the EC2 instance"
#  value       = module.ec2.instance_id
#}









# output "vpc_id" {
#   value = module.vpc_module.vpc_id
# }

# output "public_subnet_id" {
#   value = module.vpc_module.public_subnet_id
# }

# output "private_subnet_id" {
#   value = module.vpc_module.private_subnet_id
# }

# output "igw_id" {
#   value = module.vpc_module.igw_id
# }



# # outputs.tf in the root module

# output "ec2_instance_ids" {
#   description = "The IDs of the EC2 instances from the module"
#   value       = module.vpc_module.ec2_instance_ids
# }

# output "ec2_public_ips" {
#   description = "The public IP addresses of the EC2 instances from the module"
#   value       = module.vpc_module.ec2_public_ips
# }

output "vpc_ids" {
  description = "List of VPC IDs from all module instances"
  value       = [for m in module.vpc_module : m.vpc_id]
}

output "public_subnet_ids" {
  description = "List of public subnet IDs from all module instances"
  value       = [for m in module.vpc_module : m.public_subnet_id]
}

output "private_subnet_ids" {
  description = "List of private subnet IDs from all module instances"
  value       = [for m in module.vpc_module : m.private_subnet_id]
}

output "igw_ids" {
  description = "List of Internet Gateway IDs from all module instances"
  value       = [for m in module.vpc_module : m.igw_id]
}

output "ec2_instance_ids" {
  description = "List of EC2 instance IDs from all module instances"
  value       = [for m in module.vpc_module : m.ec2_instance_ids]
}

output "ec2_public_ips" {
  description = "List of public IPs from all module instances"
  value       = [for m in module.vpc_module : m.ec2_public_ips]
}
