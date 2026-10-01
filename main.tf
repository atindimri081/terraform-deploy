# 1. Settings & Required Providers Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# 2. Provider Configuration Block
provider "aws" {
  region = "us-east-1"
}

# 3. Resource Block (Creates the EC2 instance)
resource "aws_instance" "Deploy_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"

  tags = {
    Name  = "Deploy_instance" # Capital 'N' displays as the name in AWS Console
    owner = "atin"
  }
}