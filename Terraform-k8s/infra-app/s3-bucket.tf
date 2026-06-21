resource "aws_s3_bucket" "s3-bucket" {
  bucket        = "${var.env}-infra-bucket-prajwa10l"
  force_destroy = true # Helpful for dev/stg teardowns

  tags = {
    Name        = "${var.env}-infra-bucket"
    Environment = var.env
  }
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}