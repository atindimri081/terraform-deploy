# 1. Terraform settings & required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# 2. AWS Provider configuration
provider "aws" {
  region = "us-east-1"
}

# 3. Dynamic AMI Lookup (Fetches the latest Ubuntu 22.04 LTS image)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Official Canonical AWS account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# 4. EC2 Instance Resource block
resource "aws_instance" "Deploy_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name  = "Deploy_instance"
    owner = "atin"
  }
}