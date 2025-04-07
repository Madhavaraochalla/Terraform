variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "Madhav-Main-prokopto" # Setting the default bucket name
}

variable "aws_region" {
  description = "AWS region for the S3 bucket"
  type        = string
}
