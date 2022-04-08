terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-3"
}

# Create a VPC
resource "aws_vpc" "alexVpc" {
  cidr_block = "192.100.0.0/16"
  tags = {
    "Name":"alex-vpc"
  }
}

resource "aws_subnet" "Web" {
  cidr_block = "192.100.0.0/27"
  vpc_id = aws_vpc.alexVpc.id
  tags = {
    "Name":"alex-web"
  }
}


resource "aws_subnet" "App" {
  cidr_block = "192.100.0.32/27"
  vpc_id = aws_vpc.alexVpc.id
  tags = {
    "Name":"alex-app"
  }
}


resource "aws_subnet" "DB" {
  cidr_block = "192.100.0.64/28"
  vpc_id = aws_vpc.alexVpc.id
  tags = {
    "Name":"alex-db"
  }
}