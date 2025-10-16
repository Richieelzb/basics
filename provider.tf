terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.0"
    }
  }

  backend "s3" {
    bucket       = "terraform-bucket-lzb-001"
    key          = "basics/terraform.tfstate"
    region       = "ap-south-1"
    //profile      = "default"
    #use_lockfile = true
  }
}

provider "aws" {
  //profile = "default"
  region = var.aws-region
}