resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "tlopez-vpc"
    env  = "Dev"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "pubsub1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_customer_owned_ip_on_launch = true
  tags = {
    Name = "tlopez-pubsub1"
    env  = "Dev"
  }
}

resource "aws_subnet" "pubsub2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1b"
  map_customer_owned_ip_on_launch = true
  tags = {
    Name = "tlopez-pubsub2"
    env  = "Dev"
  }
}
