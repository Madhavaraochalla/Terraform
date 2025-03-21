terraform {
  backend "s3" {
    bucket  = "terraform-state-1742440359"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    ### dynamodb_table = "terraform-lock-table"
  }
}
