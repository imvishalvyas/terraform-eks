resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_cidr_1a
  availability_zone = var.az_1a

  tags = {
    "Name"                             = var.private_subnet_1a_name
    "kubernetes.io/role/internal-elb"  = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_cidr_1b
  availability_zone = var.az_1b

  tags = {
    "Name"                             = var.private_subnet_1b_name
    "kubernetes.io/role/internal-elb"  = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.public_cidr_1a
  availability_zone       = var.az_1a
  map_public_ip_on_launch = true

  tags = {
    "Name"                             = var.public_subnet_1a_name
    "kubernetes.io/role/elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.public_cidr_1b
  availability_zone       = var.az_1b
  map_public_ip_on_launch = true

  tags = {
    "Name"                             = var.public_subnet_1b_name
    "kubernetes.io/role/elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}