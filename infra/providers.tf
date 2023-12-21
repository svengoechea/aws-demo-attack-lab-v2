terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.22.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.46.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.4"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.16.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
  required_version = "~> 1.3"
}

provider "aws" {
  region = var.region
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "docker" {}

provider "random" {}

provider "kubectl" {}

provider "time" {}

### If you want to connect to K8s Cluster using EKS (not necessary)
# data "aws_eks_cluster" "cluster" {
#   name = module.eks.cluster_name
# }

# data "aws_eks_cluster_auth" "cluster" {
#   name = module.eks.cluster_name
# }

# provider "kubernetes" {
#   host                   = data.aws_eks_cluster.cluster.endpoint
#   token                  = data.aws_eks_cluster_auth.cluster.token
#   cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
# }

