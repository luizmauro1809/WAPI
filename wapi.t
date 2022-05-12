terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.56.0"
    }
  }
}

provider "aws" {
   region = "us-east-1"
   profile = "asctf1" #Profile a ser criado
}


resource "aws_instance" "wapi" {
    count = 1
    ami = "ami-06fff60dfe880f035"
    instance_type = "t3.micro"
    subnet_id = "subnet-0e675e8a139f6d01a"
    vpc_security_group_ids = [ "sg-0feebc4c15851977d" ]
    associate_public_ip_address = "true"

    root_block_device {
      volume_size = "30"
      volume_type = "gp2"
      tags = {
        Name = "WAPI204"      }
    }

    tags = {
      Name = "WAPI204"
    }
}
