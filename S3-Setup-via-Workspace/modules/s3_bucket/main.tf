resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_prefix}-${terraform.workspace}"

  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}
