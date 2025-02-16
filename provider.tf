# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


terraform {
  backend "s3" {
    bucket = "tsering-backend-s3"
    key    = "terraform-state"
    region = "us-east-1"
    # dynamodb_table = "terraform-state-lock-dynamo-2025"
    # encrypt = true

  }
}