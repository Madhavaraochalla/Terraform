terraform {
  backend "s3" {
    bucket  = "terraform-state-chall-123456789-dev"
    key     = "Dev/vpc/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

