resource "aws_s3_bucket" "bucket" {
bucket = lower(var.bucket.name)

  tags = {
    Name        = "${var.bucket.name}-${var.bucket.environment}"
    environment = var.bucket.environment
  }
}