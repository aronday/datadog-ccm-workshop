module "eks-prod" {
  depends_on = [ module.vpc-storedog-prod ]
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"
  cluster_name    = "${local.cluster_name}-prod"
  cluster_version = 1.29

  vpc_id     = module.vpc-storedog-prod.vpc_id
  subnet_ids = module.vpc-storedog-prod.private_subnets

  node_security_group_tags = {
    "kubernetes.io/cluster/${local.cluster_name}-prod" = null
  }

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
    attach_cluster_primary_security_group = true

    # Disabling and using externally provided security groups
    create_security_group = false
  }

  eks_managed_node_groups = {
    one = {
      name = "storedog-group-1-prod"
      instance_types = ["t3.medium"]
      min_size     = 1
      max_size     = 3
      desired_size = 2
      pre_bootstrap_user_data = <<-EOT
      echo 'Storedog Node Group - Prod'
      EOT

      vpc_security_group_ids = [
        aws_security_group.node_group_one_prod.id
      ]
    }
  }
}

#Create the Kubernetes Namespace for the application + Datadog
resource "kubernetes_namespace" "storedog" {
  depends_on = [ module.eks-prod ]
  metadata {
    name = "storedog"
  }
}