resource "aws_s3_bucket" "example" {
  # This combines a prefix with whatever name you provide
  bucket = "portfolio-${var.bucket_name}"
}