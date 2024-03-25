
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