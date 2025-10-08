resource "aws_subnet" "private-us-east-1a" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_cidr_1a
  availability_zone = "us-east-1a"

  tags = {
    "Name"                             = "private-us-east-1a"
    "kubernetes.io/role/internal-elb"  = "1"
    "kubernetes.io/cluster/my-cluster" = "owned"
  }
}

resource "aws_subnet" "private-us-east-1b" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.private_cidr_1b
  availability_zone = "us-east-1b"

  tags = {
    "Name"                             = "private-us-east-1b"
    "kubernetes.io/role/internal-elb"  = "1"
    "kubernetes.io/cluster/my-cluster" = "owned"
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.public_cidr_1a
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                             = "public-us-east-1a"
    "kubernetes.io/role/elb"           = "1"
    "kubernetes.io/cluster/my-cluster" = "owned"
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.public_cidr_1b
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                             = "public-us-east-1b"
    "kubernetes.io/role/elb"           = "1"
    "kubernetes.io/cluster/my-cluster" = "owned"
  }
}