resource "aws_dynamodb_table" "dynamodb" {
  name         = "${var.env}-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID" # MUST be exactly LockID for Terraform S3 backend

  attribute {
    name = "LockID" # MUST be exactly LockID
    type = "S"
  }

  tags = {
    name = "${var.env}-infra-dynamodb"
  }
}
