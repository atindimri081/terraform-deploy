# 1. Terraform settings & required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # 🪣 Remote State Backend
  backend "s3" {
    bucket = "atin-tf-state-bucket-2026" # ⚠️ Put your exact created bucket name here
    key    = "ec2/terraform.tfstate"  # File path inside the S3 bucket
    region = "us-east-1"
  }
}

# 2. AWS Provider
provider "aws" {
  region = "us-east-1"
}

# 3. Dynamic AMI Lookup
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# 4. EC2 Instance Resource
resource "aws_instance" "Deploy_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name  = "Deploy_instance"
    owner = "atin"
  }
}

output "instance_id" {
  value = aws_instance.Deploy_instance.id
}
output "instance_public_ip" {
  value = aws_instance.Deploy_instance.public_ip
}