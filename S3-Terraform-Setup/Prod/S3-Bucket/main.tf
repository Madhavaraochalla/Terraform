terraform {
  backend "s3" {
    bucket  = "terraform-state-1742440359" # Your S3 backend bucket
    key     = "prod/terraform.tfstate"      # Path to store state file
    region  = "us-east-1"                  # Backend S3 region
    encrypt = true                         # Enable encryption for security
    ###dynamodb_table = "terraform-lock"            # Optional: For state locking
  }
}


provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}
