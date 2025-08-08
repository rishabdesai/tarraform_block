terraform {
  required_version = ">= 1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.8.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = "my_vpc"
  }
}

# create security groups for EC2 (public and private instance)
resource "aws_security_group" "my_vpc_default_sg" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my_sg"
  }
  #allow all inbound traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow all outbound traffic 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "public" {
  source            = "./public_infra"
  vpc_id            = aws_vpc.my_vpc.id
  security_group_id = aws_security_group.my_vpc_default_sg.id
}

module "private" {
  source            = "./private_infra"
  vpc_id            = aws_vpc.my_vpc.id
  security_group_id = aws_security_group.my_vpc_default_sg.id
}
