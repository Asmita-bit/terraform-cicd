locals {
  ec2_name = "asmita-${var.project}-${terraform.workspace}-ec2"

  common_tags = {
    Creator     = "asmita"
    Environment = terraform.workspace
    Project     = var.project
  }

  bucket_name = "asmita-${var.project}-${terraform.workspace}-bucket948596"
  tags = {
    Creator     = "asmita"
    Project     = var.project
    Environment = terraform.workspace
  }
}