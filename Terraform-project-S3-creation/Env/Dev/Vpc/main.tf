provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source               = "../../../modules/Vpc"
  aws_region           = "us-east-1"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
  availability_zone    = "us-east-1a"
  env                  = "dev"
}
