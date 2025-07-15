terraform {
    backend "s3" {
    bucket       = "asmitagupta-terraform-state-bucket"
    key          = "ec2/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  } 
}

