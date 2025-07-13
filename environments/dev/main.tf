variable "aws_region" {
  default = "us-east-1"
}

module "instance_template" {
  source        = "../../modules/instance_template"
  ami_id        = "ami-05ffe3c48a9991133" # Example AMI
  instance_type = "t2.micro"
  project       = "hello-world"
}

module "s3_store" {
  source      = "../../modules/s3_store"
  project     = "hello-world"
}

