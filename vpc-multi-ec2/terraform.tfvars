vpc_cidr            = "10.0.0.0/16"
vpc_name            = "Terraform-VPC"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
azs                 = ["us-east-1a", "us-east-1b"]
private_subnet_cidr = "10.0.3.0/24"
key_name        = "terraform_keypai"
public_key_path = "my-keypair.pub"

instances = [
  {
    name          = "Jenkins"
    ami           = "ami-084568db4383264d4"
    instance_type = "t2.medium"
    role          = "jenkins.sh"
  },
  {
    name          = "Build-server"
    ami           = "ami-084568db4383264d4"
    instance_type = "t2.medium"
    role          = "build.sh"
  },
  {
    name          = "SonarQube"
    ami           = "ami-084568db4383264d4"
    instance_type = "t2.medium"
    role          = "sonarqube.sh"
  },  
  {
    name          = "Minikube"
    ami           = "ami-084568db4383264d4"
    instance_type = "t2.medium"
    role          = "minikube.sh"
  }
]
ec2_sg_name = "Terraform-EC2-SG"
volume_size = 20