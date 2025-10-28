terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.30"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.10"
    }
  }

  backend "s3" {

    bucket         = "comp-tf-statefile"  # replace with your bucket
    key            = "eks/terraform.tfstate"
    region         = "eu-central-1"
    
  }
}
module "vpc_network" {
  source = "./modules/vpc_network"
  name   = "compredict"
  vpc_cidr = "10.0.0.0/16"
  availability_zones = ["eu-central-1a", "eu-central-1b"]
}
module "eks" {
  source       = "./modules/eks"
  name         = "compredict"
  cluster_name = "compredict-eks-cluster"
  subnet_ids   = module.vpc_network.subnet_ids
}
module "flux" {
  source          = "./modules/flux-bootstrap"
  github_token    = var.github_token
  github_owner    = var.github_owner # "Hanumeshjitta"
  github_repo     = var.github_repo #"compredict-gitops-flux-clusters"
  github_branch   = var.github_branch #"main"  
  flux_path       = var.flux_path #"clusters/compredict-eks-cluster"
  kubeconfig_path = module.eks.kubeconfig_path
  
  depends_on      = [module.eks]
}


