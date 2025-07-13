locals {
  bucket_name = "asmita-${var.project}-${terraform.workspace}-bucket948594"
  tags = {
    Creator     = "asmita"
    Project     = var.project
    Environment = terraform.workspace
  }
}