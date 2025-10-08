variable "az_1a" {
  default = "us-east-1a"
}

variable "az_1b" {
  default = "us-east-1b"
}

variable "private_subnet_1a_name" {
  default = "private-us-east-1a"
}

variable "private_subnet_1b_name" {
  default = "private-us-east-1b"
}

variable "public_subnet_1a_name" {
  default = "public-us-east-1a"
}

variable "public_subnet_1b_name" {
  default = "public-us-east-1b"
}
variable "managed_by" {
  default = "terraform"
}

variable "env" {
  default = "prod"
}

variable "priority" {
  default = "high"
}

variable "node_role_name" {
  default = "nodes-role"
}

variable "node_group_name" {
  default = "private-nodes"
}

variable "ebs_csi_role_name" {
  default = "AmazonEKS_EBS_CSI_DriverRole"
}

variable "eks_iam_role_name" {
  default = "my-role"
}

variable "oidc_role_name" {
  default = "my-oidc"
}

variable "vpc_name" {
  default = "my-vpc"
}

variable "cluster_name" {
  default = "my-cluster"
}

variable "internet_gateway" {
  default = "my-igw"
}

variable "nat_gateway" {
  default = "nat"
}
variable "region" {
  default = "us-east-1"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "private_cidr_1a" {
  default = "10.0.128.0/20"
}
variable "private_cidr_1b" {
  default = "10.0.144.0/20"
}
variable "public_cidr_1a" {
  default = "10.0.0.0/20"
}
variable "public_cidr_1b" {
  default = "10.0.16.0/20"
}