variable "vpc_cidr" {
  type        = string
  description = "This is my VPC cidr"
}

variable "instance_tenancy" {
  type        = string
  description = "This is my instance tenancy"
}

variable "subnet_bits" { ## i.e. if the subnet_bits variable is 8 and my vpc cidr is 10.0.0.0/16, this will add 8 to the cidr making it a 10.0.0.0/24 for the subnet
  type        = number
  description = "Subnet bits I want Added to the vpc cidr block to create my subnet cidr block"
}

variable "public_subnet_count" {
  type        = number
  description = "number of public subnets"
}

variable "private_subnet_count" {
  type        = number
  description = "number of private subnets"
}

variable "availability_zone" {
  type        = list(string)
  description = "AZs"
}