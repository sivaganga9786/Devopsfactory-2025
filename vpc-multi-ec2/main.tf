module "vpc" {
  source              = "../resources/vpc"
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  ec2_sg_name         = var.ec2_sg_name
  azs                 = var.azs
}

module "ec2" {
  source         = "../resources/ec2"
  instances      = var.instances
  subnet_id      = module.vpc.public_subnets[0]
  key_name       = var.key_name
  ec2_sg_name    = var.ec2_sg_name
  volume_size   = var.volume_size
  vpc_id     = module.vpc.vpc_id
  user_data      = [
    file("${path.module}/jenkins.sh"),
    file("${path.module}/build.sh"),
    file("${path.module}/sonarqube.sh"),
    file("${path.module}/minikube.sh")
  ]
}
