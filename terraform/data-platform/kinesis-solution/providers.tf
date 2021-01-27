provider "aws" {
  region                  = var.region
  shared_credentials_file = pathexpand("~/.aws/data/engineering")

  assume_role {
    role_arn = var.cross_account_role_arn
  }
}

terraform {
  required_providers {
    aws = {
      version = "~> 3.22.0"
      source  = "hashicorp/aws"
    }
  }
}