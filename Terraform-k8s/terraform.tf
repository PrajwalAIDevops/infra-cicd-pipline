terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "stg-infra-bucket-prajwa10l"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "stg-dynamodb"
    encrypt        = true
  }
}
