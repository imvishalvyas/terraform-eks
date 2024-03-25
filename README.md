# Terraform EKS Cluster Deployment
This repository contains Terraform code for deploying an Amazon EKS (Elastic Kubernetes Service) cluster on AWS.
```
├── README.md
├── kubernetes
│   ├── deployment.yaml
│   ├── service-account.yaml
│   └── service.yaml
└── terraform
    ├── eks-cluster.tf
    ├── igw.tf
    ├── net-gateway.tf
    ├── node-pool.tf
    ├── oidc-iam.tf
    ├── oidc-user.tf
    ├── provider.tf
    ├── route-table.tf
    ├── subnets.tf
    ├── variables.tf
    └── vpc.tf
```
## Prerequisites
Before getting started, ensure you have the following prerequisites installed and configured:

- Terraform
- AWS CLI configured with appropriate credentials and permissions

## Getting Started
Follow these steps to deploy the EKS cluster:

### 1. Clone the Repository:
```
git clone https://github.com/imvishalvyas/terraform-eks.git
```

```
cd terraform
```

### 2. Set Up Terraform Backend (Optional):
If you wish to store Terraform state remotely, configure the backend by modifying backend.tf file with your preferred backend configuration.


### 3. Provide AWS Credentials:
Ensure your AWS credentials are configured either through environment variables, AWS CLI configuration, or AWS shared credentials file.

```
aws configure
```
Update your `aws-secret-key` and `secret-access-key` here.


### 4. Review Variables:
Review the variables in the variables.tf file and provide appropriate values. Alternatively, you can create a terraform.tfvars file to override these variables.

### 5. Initialize Terraform:
```
terraform init
```

### 6. Plan the Deployment:
```
terraform plan
```
Review the plan to ensure everything looks correct.

### 7. Apply the Configuration:
```
terraform apply
```
Confirm the apply action and wait for the resources to be provisioned. You will get the ARN of the service account. Copy that ARN and add it in `kubernetes/service-account.yaml` file.

### 8. Accessing EKS Cluster:
Once the deployment is complete, you can access the EKS cluster using the kubectl command. Configure kubectl with the EKS cluster credentials:
```
aws eks --region us-east-1 update-kubeconfig --name my-cluster
```
Here I have used the `us-east1` region and cluster name as `my-cluster`

### 10. Creating resources
Create service account file, Make sure to add the ARN.
```
kubectl create -f service-account.yaml
```
Create Kubernetes deployment, Here I have used the Hello world docker image.
```
kubectl create -f kubernetes/deployment.yaml
```
Expose the deployment using `service.yaml` file.
```
kubectl create -f kubernetes/service.yaml
```
Service is now exposed to the cluster IP, You need to port-forward the port in order to access the web page locally. You can also create an ingress controller to access it globally, Here I will access it using port-forward method.
```
kubectl port-forward svc/my-app 80:80
```
Now you can access the hello-world web page using the URL http://localhost.

### 9. Clean Up (Optional):
If you want to tear down the resources created by Terraform, run:
```
terraform destroy
```
Confirm the destruction to delete all the created resources.




