provider "aws" {
  region = var.region
  default_tags {
    tags = {
      ManagedBy = var.managed_by
      Env       = var.env
      Priority  = var.priority
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}