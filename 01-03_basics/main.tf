terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_instance" "app_server" {
    ami = "ami-04beabd6a4fb6ab6f"
    instance_type = "t2.micro"

    tags = {
        Name = "ExampleAppServerInstance"
    }
}