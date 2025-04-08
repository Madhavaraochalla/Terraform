provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source               = "../../../modules/Vpc"
  aws_region           = "us-east-1"
  vpc_cidr             = "178.35.14.0/16"
  public_subnet_cidr   = "178.35.14.0/24"
  private_subnet_cidr  = "178.35.14.0/24"
  availability_zone    = "us-east-1a"
  env                  = "dev"
}
