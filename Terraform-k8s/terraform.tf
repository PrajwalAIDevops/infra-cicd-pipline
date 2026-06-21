terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

 
  backend "s3" {
    bucket         = "stg-infra-bucket-prajwa10l" # Replace with your exact S3 state bucket
    key            = "stage/terraform.tfstate"
    region         = "us-east-1"
    
    # FIX: Remove dynamodb_table line completely and replace it with this:
    use_lockfile   = true
  }

}
