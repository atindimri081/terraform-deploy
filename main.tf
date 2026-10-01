terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

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
