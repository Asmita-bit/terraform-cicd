locals {
  bucket_name = "asmita-${var.project}-${terraform.workspace}-bucket948596"
  tags = {
    Creator     = "asmita"
    Project     = var.project
    Environment = terraform.workspace
  }
}

resource "aws_s3_bucket" "asmita_s3" {
  bucket = local.bucket_name
  tags   = local.tags
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.asmita_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}
