resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "tlopez-vpc"
    env  = "Dev"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "tlopez-igw"
  }
}

resource "aws_subnet" "public" {
  count = var.public_subnet_count
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = cidrsubnet(var.vpc_cidr, var.subnet_bits, count.index)
  availability_zone               = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "tlopez-public"
    env  = "Dev"
  }
}

resource "aws_subnet" "private" {
  count = var.private_subnet_count
  vpc_id                          = aws_vpc.main.id
  cidr_block                      = cidrsubnet(var.vpc_cidr, var.subnet_bits, count.index + var.public_subnet_count)
  availability_zone               = element(var.availability_zone, count.index)
  tags = {
    Name = "tlopez-private"
    env  = "Dev"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "tlopez-publicroutetable"
    env  = "Dev"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public" {
  count = 2
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public[count.index].id
}