provider "aws" {
  region = var.defaultRegion
}

resource "aws_security_group" "mock-sg" {
  name        = "mock-sg"
  description = "Security group for the mock instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "mock-instance" {
  ami           = var.ami
  instance_type = "t2.micro"
  tags = {
    Name = "mock-instance"
  }

  security_groups = [aws_security_group.mock-sg.name]
}
