variable "vpc_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.10.20.0/24"
}

variable "ubuntu_ami" {
  type    = string
  default = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "aws-key-4aug2025-onedrive"
}
