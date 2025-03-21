resource "aws_s3_bucket" "bucket" {
  bucket = "my-terraform-s3-bucket"
}


resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}
