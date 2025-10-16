terraform {
  backend "s3" {
    bucket       = "terraform-practice-lzb-001"
    key          = "vpc/terraform.tfstate"
    region       = "eu-west-1"
    use_lockfile = true

  }
}

provider "aws" {
  region     = var.aws-region
}