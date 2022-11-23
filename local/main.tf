# Setup terraform providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.40.0"
    }
  }

  required_version = ">= 1.3.0"
}

# Setup AWS provider
provider "aws" {
  region = var.aws_region
}
