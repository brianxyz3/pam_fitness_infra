# terraform {
#   required_version = ">= 1.5.0"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }

#   backend "s3" {
#     bucket         = "your-terraform-state-bucket"
#     key            = "pam_fitness_app/terraform.tfstate"
#     region         = "eu-west-1"
#     dynamodb_table = "terraform-lock-table"
#     encrypt        = true
#   }
# }

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "ecr" {
  source = "./modules/ecr"
}

module "ec2" {
  source = "./modules/ec2"

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
  alb_sg_id = module.alb.alb_sg_id
}


module "alb" {
  source = "./modules/alb"

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
  frontend_id = module.ec2.frontend_id
  backend_id = module.ec2.backend_id
}

module "nat" {
  source = "./modules/nat"
  
  vpc_id          = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
}