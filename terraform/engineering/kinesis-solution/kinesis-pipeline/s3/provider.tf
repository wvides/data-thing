provider "aws" {
  region                  = var.region
  shared_credentials_file = pathexpand("~/.aws/data/terraform")
  alias                   = "data-platform"

  assume_role {
    role_arn = var.cross_account_role_arn
  }
}