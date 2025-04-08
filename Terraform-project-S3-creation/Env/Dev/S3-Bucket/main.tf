provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source           = "../../../modules/s3_bucket"
  bucket_name      = var.bucket_name
  enable_versioning = var.enable_versioning
}
