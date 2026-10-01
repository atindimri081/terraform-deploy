terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Terraform automatically uses credentials from `aws configure`
provider "aws" {
  region = "us-east-1"
}


# Create a simple ec2 instance
resource "aws_instance" "my_first_cloud_ec2" {
  ami           = "ami-0b245cc5f82576748"
  instance_type = "t3.micro"


  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform"
    Bill        = "20000 Rupees/month"
    Owner       = "Smith"
  }
}
output "ec2_id" {
  value = aws_instance.my_first_cloud_ec2.id
} 

output "ec2_id" {
  value = aws_instance.my_first_cloud_ec2.ipv4_address
}
#testing the output block.
#Testing the github actions.