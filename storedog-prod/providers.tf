terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
    }
  }

  required_version = "~> 1.4"
}

provider "kubernetes" {
  host                   = module.eks-prod.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks-prod.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      module.eks-prod.cluster_name
    ]
  }
}

provider "aws" {
  region = "us-east-1"
}