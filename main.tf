provider "aws" {
  region = var.defaultRegion
}

resource "aws_instance" "mock-instance" {
  ami           = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = "mock-instance"
  }
}