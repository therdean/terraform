terraform {
  backend "s3" {
    bucket  = "tf-state-bucket-b10a8d4f0c8e62d60697e142e9e9cb1b"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.defaultRegion
}

module "security_group" {
  source              = "./modules/security-group"
  name                = "mock-sg"
  description         = "sg for the mock"
  ingress_from_port   = 22
  ingress_to_port     = 22
  ingress_protocol    = "tcp"
  ingress_cidr_blocks = ["0.0.0.0/0"]
}

module "ec2" {
  source              = "./modules/ec2"
  ami                 = var.ami
  instance_type       = "t2.micro"
  instance_name       = "mock-instance"
  security_group_name = module.security_group.sg_id
  instance_count      = var.instance_count
  depends_on_sg       = [module.security_group.sg_id]
}
