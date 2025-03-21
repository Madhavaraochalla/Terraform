variable "enable_versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
}

variable "archive_days" {
  description = "Number of days before moving objects to Glacier"
  type        = number
}

variable "expire_days" {
  description = "Number of days before objects expire"
  type        = number
}
