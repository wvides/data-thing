provider "aws" {
  region                  = var.region
  shared_credentials_file = pathexpand("~/.aws/data/engineering")
}

terraform {
  required_providers {
    aws = {
      version = "~> 3.22.0"
      source  = "hashicorp/aws"
    }
  }
}