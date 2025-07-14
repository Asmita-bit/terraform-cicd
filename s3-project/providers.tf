terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "asmitagupta-terraform-state-bucket"
    key          = "s3/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true #S3 native locking

  }
}

provider "aws" {
  region = var.aws_region
}