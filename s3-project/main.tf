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

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.asmita_s3.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = data.terraform_remote_state.ec2_project.outputs.ec2_instance_arn
        }
        Action = [
          "s3:PutObject",
          "s3:GetObject",
        ]
        Resource = "${aws_s3_bucket.asmita_s3.arn}/*"
      }
    ]
  })
}

data "terraform_remote_state" "ec2_project" {
  backend = "s3"
  config = {
    bucket = "asmitagupta-terraform-state-bucket"
    key    = "ec2/terraform.tfstate"
    region = "us-east-1"
  }
}
