terraform {
  backend "s3" {
    bucket = "terraform-state-devopsthehardway-jmo"
    key    = "ecr-terraform.tfstate"
    region = "eu-west-3"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_ecr_repository" "devopsthehardway-ecr-repo" {
  name                 = var.repo_name
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {
    encryption_type = "KMS"
  }
}