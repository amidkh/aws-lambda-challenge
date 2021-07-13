terraform {
  required_version = "~> 0.15.1"
  backend "s3" {
    bucket = "tfstate-lambda-challenge"  # 4. Put your bucket here
    key = "test"
    region = "us-west-2"                 # 5. Put your region here
  }
  required_providers {
    aws = {
    source = "hashicorp/aws"
    #  Lock version to prevent unexpected problems
    version = "3.46"
    }
  }
}

provider "aws" {
  region                  = var.region
}
