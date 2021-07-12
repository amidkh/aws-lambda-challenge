terraform {
  required_version = "~> 0.15.1"
  backend "s3" {
    bucket = "..."                # 4. Put your bucket name here
    key = "test"
    region = "..."                # 5. Put your region name here    
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
