module "s3_bucket" {
  source        = "./modules/s3_bucket"
  bucket_prefix = "my-bucket-zingly"
}
