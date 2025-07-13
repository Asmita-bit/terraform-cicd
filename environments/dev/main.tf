variable "aws_region" {
  default = "us-east-1"
}

module "instance_template" {
  source        = "../../modules/instance_template"
  ami_id        = "ami-05ffe3c48a9991133" # Example AMI
  instance_type = "t2.micro"
  project       = "hello world"
}

module "s3_storage" {
  source      = "../../modules/s3_storage"
  bucket_name = local.bucket_name
  project     = "hello world"
}




