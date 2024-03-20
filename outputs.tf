output "cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks-dev.cluster_id
}

output "kubectl" {
  description = "Add Kubectl Context"
  value = "aws eks update-kubeconfig --region us-east-1 --name ${module.eks-dev.cluster_name}"
}