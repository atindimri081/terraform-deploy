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

# 3. EC2 Instance Resource block
resource "aws_instance" "Deploy_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"

  tags = {
    Name  = "Deploy_instance"
    owner = "atin"
  }
}