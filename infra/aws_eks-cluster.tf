locals {
  cmd_update_kube_config = "aws eks update-kubeconfig --name ${module.eks.cluster_name} --region ${var.region}"
}
## Updating the local Kubeconfig
resource "null_resource" "update-kube-config" {
  provisioner "local-exec" {
    command = local.cmd_update_kube_config
  }
  depends_on = [
    module.eks
  ]
}

module "eks" {
  source                         = "terraform-aws-modules/eks/aws"
  version                        = "19.0.4"
  cluster_name                   = "${var.deployment_name}-${random_string.unique_id.result}"
  cluster_version                = "1.27"
  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true
  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }
  eks_managed_node_groups = {
    one = {
      name = "${var.deployment_name}-ng1"

      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 5
      desired_size = 2
    }
    two = {
      name = "${var.deployment_name}-ng2"

      instance_types = ["t3.medium"]

      min_size     = 0
      max_size     = 2
      desired_size = 0
    }
  }
}