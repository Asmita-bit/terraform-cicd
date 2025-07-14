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

resource "aws_s3_bucket" "this" {
  bucket = "example-restricted-bucket-1234"
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

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
        Resource = "${aws_s3_bucket.this.arn}/*"
      }
    ]
  })
}

# Fetch the remote state from the EC2 project
data "terraform_remote_state" "ec2_project" {
  backend = "s3"
  config = {
    bucket = "remote-state-bucket-name"
    key    = "ec2-project/terraform.tfstate"
    region = "us-east-1"
  }
}

# Assume the EC2 project outputs the ARN as "ec2_instance_arn"
output "remote_ec2_arn" {
  value = data.terraform_remote_state.ec2_project.outputs.ec2_instance_arn
}
