# EKS Cluster Add-ons
# This file configures recommended EKS add-ons using Terraform resources.


resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.my-cluster.name
  addon_name   = "coredns"
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.my-cluster.name
  addon_name   = "kube-proxy"
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.my-cluster.name
  addon_name   = "vpc-cni"
  resolve_conflicts = "OVERWRITE"
}
