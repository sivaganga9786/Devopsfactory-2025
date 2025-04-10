terraform {
  backend "s3" {
    bucket         = "terraformec2346536567"
    key            = "ec2/terraform.tfstate"   # folder path inside the bucket
    region         = "us-east-1"
    encrypt        = true
  }
}