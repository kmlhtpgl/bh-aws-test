terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.51.1"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "github" {
  token = var.github_token
  organization = "kmlhtpgl"
}
