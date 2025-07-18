terraform {
   backend "s3" {
    bucket       = "asmitagupta-terraform-state-bucket"
    key          = "s3/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true #S3 native locking
  }
}