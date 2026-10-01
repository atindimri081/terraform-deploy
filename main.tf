terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.0.0"
    }
  }
}

<<<<<<< HEAD
provider "aws" {
  region = "us-east-1"
}
=======
on:
  push:
    branches:
      - main
    paths:
      - 'main.tf'
  schedule:
    - cron: '0 9 * * *'  # Runs daily at 09:00 UTC as a safety syncd
>>>>>>> e54e5b7138a40074d839eb974e1ea06b6935ac79

resource "aws_instance" "web_server" {
  ami           = "ami-0b245cc5f82576748"
  instance_type = "t3.micro"

  tags = {
    Name = "CI-CD-Deployed-Server"
    Owner = "Atin"
  }
}

#some print values
output "instance_id" {
  value = aws_instance.web_server.id
}
output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}
