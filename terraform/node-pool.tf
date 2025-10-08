resource "aws_iam_role" "nodes-role" {
  name = "nodes-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "my-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes-role.name
}

resource "aws_iam_role_policy_attachment" "my-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes-role.name
}

resource "aws_iam_role_policy_attachment" "my-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes-role.name
}


resource "aws_security_group" "eks_node_group_sg" {
  name        = "eks-node-group-sg"
  description = "Security group for EKS node group"
  vpc_id      = aws_vpc.my-vpc.id # Replace with your VPC ID

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic from anywhere
  }
}

resource "aws_launch_template" "eks_node_group_launch_template" {
  name_prefix = "eks-node-group"

  block_device_mappings {
    device_name = "/dev/xvdb"

    ebs {
      volume_size = 20
      volume_type = "gp2"
    }
  }
  #source_security_group_ids = [aws_security_group.eks_node_group_sg.id]
  #security_group_names = [aws_security_group.eks_node_group_sg.name]  # Use security_group_names instead
}


resource "aws_eks_node_group" "private-nodes" {
  cluster_name    = var.cluster_name
  node_group_name = "private-nodes"
  node_role_arn   = aws_iam_role.nodes-role.arn
  subnet_ids = [
    aws_subnet.private-us-east-1a.id,
    aws_subnet.private-us-east-1b.id
  ]

  launch_template {
    id      = aws_launch_template.eks_node_group_launch_template.id
    version = aws_launch_template.eks_node_group_launch_template.latest_version
  }
  capacity_type  = "ON_DEMAND"
  instance_types = ["t3a.large"]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 0
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    role = "general"
  }

  depends_on = [
    aws_iam_role_policy_attachment.my-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.my-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.my-AmazonEC2ContainerRegistryReadOnly,
    aws_eks_cluster.my-cluster,
  ]
}

