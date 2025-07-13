variable "aws_region" {
  default = "us-east-1"
}

module "ec2_modules" {
  source        = "../../modules/ec2_modules"
  ami_id        = "ami-05ffe3c48a9991133" # Example AMI
  instance_type = "t2.micro"
  project       = "hello-world"
}

module "s3_modules" {
  source      = "../../modules/s3_modules"
  project     = "hello-world"
}

