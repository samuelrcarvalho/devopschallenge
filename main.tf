provider "aws" {
  version = "~> 2.70"
  region  = var.region
}

terraform {
  required_version = "> 0.13.0"
}

