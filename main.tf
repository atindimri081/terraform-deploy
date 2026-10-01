terraform{
    required_providers{
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
    providers{
        aws = {
            region = "us-east-1"
        }
    }
#Added the resource block to create an EC2 instance with the specified AMI and instance type. The tags block is used to assign a name and owner to the instance for easier identification.
    resource "aws_instance" "Deploy_instance" {
        ami           = "ami-0c55b159cbfafe1f0"
        instance_type = "t3.micro"

    tags{
        name = "Deploy_instance"
        owner = "atin"
    }

    }
}