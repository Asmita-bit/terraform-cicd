locals {
  ec2_name = "asmita-${var.project}-${terraform.workspace}-ec2"

  common_tags = {
    Creator     = "asmita"
    Environment = terraform.workspace
    Project     = var.project
  }
}

