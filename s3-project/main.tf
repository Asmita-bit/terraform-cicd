resource "aws_s3_bucket" "asmita_s3"{
  bucket = var.bucket_name
  tags = {
    Name        = var.Name
    Creator     = var.Creator
 }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.asmita_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

