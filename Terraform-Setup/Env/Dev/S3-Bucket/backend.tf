terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-9010"
    key            = "Dev/s3-bucket/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
### dynamodb_table = "terraform-lock" # optional for state locking ####
  }
}
