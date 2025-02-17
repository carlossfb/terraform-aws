terraform {
  required_version = ">=v1.6.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = "dev"
      Owner       = "terraform"
      Project     = "iam"
    }
  }
}