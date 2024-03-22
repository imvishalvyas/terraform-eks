data "aws_iam_policy_document" "my_oidc_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks.url, "https://", "")}:sub"
      values   = ["system:serviceaccount:default:aws-test"]
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }
}

resource "aws_iam_role" "my_oidc" {
  assume_role_policy = data.aws_iam_policy_document.my_oidc_assume_role_policy.json
  name               = "my-oidc"
}

resource "aws_iam_policy" "my-user-policy" {
  name = "my-user-policy"

  policy = jsonencode({
    Statement = [{
      Action = [
        "s3:ListAllMyBuckets",
        "s3:GetBucketLocation"
      ]
      Effect   = "Allow"
      Resource = "arn:aws:s3:::*"
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = aws_iam_role.my_oidc.name
  policy_arn = aws_iam_policy.my-user-policy.arn
}

output "my_policy_arn" {
  value = aws_iam_role.my_oidc.arn
}