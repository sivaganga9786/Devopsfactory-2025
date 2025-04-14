module "vpc_module" {
  source              = "../vpc-resources"
  vpc_cidr_block      = var.vpc_cidr_block
  vpc_name            = var.vpc_name
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  ec2_sg_name         = var.ec2_sg_name
  ami                 = var.ami
  instance_count      = 1
  instance_type       = var.instance_type
  ec2_instance_name   = var.ec2_instance_name
  #user_data = file("${path.module}/sonarqube.sh")
 # user_data = file("${path.module}/jenkins.sh")
  #user_data = file("${path.module}/trivy.sh")
  user_data = file("${path.module}/minikube.sh")
}

# module "vpc_module" {
#   for_each            = var.ec2_instances

#   source              = "../vpc-resources"
#   vpc_cidr_block      = var.vpc_cidr_block
#   vpc_name            = var.vpc_name
#   public_subnet_cidr  = var.public_subnet_cidr
#   private_subnet_cidr = var.private_subnet_cidr
#   ec2_sg_name         = var.ec2_sg_name
#   ami                 = var.ami
#   instance_count      = 1
#   instance_type       = var.instance_type

#   ec2_instance_name   = each.key
#   user_data           = file("${path.module}/${each.value}")
# }




