terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"
    }
  }


  backend "s3" {
    bucket  = "tlopez-terraform-pract"
    key     = "demo.tfstate"
    region  = "us-east-1"
    profile = "luffy"
  }
}

provider "aws" {
  profile = "luffy"
  region  = "us-east-1"
}