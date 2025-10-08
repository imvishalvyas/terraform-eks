terraform {
  backend "s3" {
    bucket  = "terraform-eks-vishal-zuru"
    key     = "terraform/eks/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    # dynamodb_table = "<your-dynamodb-table-name>" # Optional: for state locking
  }
}

# Replace <your-s3-bucket-name> and <your-dynamodb-table-name> with your actual resources.
# Make sure the S3 bucket and DynamoDB table exist before running 'terraform init'.
