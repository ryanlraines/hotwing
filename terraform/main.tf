terraform {
  required_version = ">= 1.0.8"
  required_providers {
    aws = {
      version = ">= 3.67.0"
      source  = "hashicorp/aws"
    }
  }
}


module "dev" {
  source                = "./modules/eks"
  cluster_name               = "dev"
}

module "qa" {
  source                = "./modules/eks"
  cluster_name               = "qa"
}

