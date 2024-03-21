# Storedog EKS Clusters with Terraform

This repository contains Terraform code to deploy two Amazon EKS (Elastic Kubernetes Service) clusters designed for the Storedog e-commerce application. The setup includes separate environments for Development and Production, each with its own Kubernetes cluster, VPC, Security Groups, and other necessary dependencies. Additionally, this configuration deploys the Datadog Agent on the EKS clusters via Helm to monitor the clusters' performance and the health of the Storedog application.

## Prerequisites

- **AWS Account**: Ensure you have an AWS account with the necessary permissions to create the resources defined in the Terraform configurations.
- **Terraform**: Install Terraform. You can download it from [terraform.io](https://www.terraform.io/downloads.html).
- **kubectl**: The Kubernetes command-line tool, kubectl, allows you to run commands against Kubernetes clusters. Install `kubectl` following the instructions [here](https://kubernetes.io/docs/tasks/tools/).
- **Helm**: Helm is a tool for managing Kubernetes packages. Install Helm following the instructions [here](https://helm.sh/docs/intro/install/).
- **AWS CLI**: Install and configure the AWS CLI with credentials that allow you to manage your AWS resources. Installation instructions can be found [here](https://aws.amazon.com/cli/).

## Repository Structure
```
.
├── storedog-dev    # Development environment resources
│   ├── main.tf
│   ├── ...
└── storedog-prod   # Production environment resources
    ├── main.tf
    ├── ...
```

Each environment folder (storedog-dev and storedog-prod) contains Terraform configuration files for deploying the EKS cluster, VPC, Security Groups, and other necessary infrastructure for the respective environment.

## Deploying the Infrastructure

 1. **Initialize Terraform Workspace**
   
    Navigate to the environment directory you wish to deploy, either storedog-dev or storedog-prod, and initialize the Terraform workspace:

      ```
    cd storedog-<env>
     terraform init
    ```

2. **Create a Terraform Plan**
   
   Generate a Terraform plan to review the changes that will be applied:

   ```
    terraform plan
   ```

3. **Apply the Terraform Configuation**
   
   Apply the Terraform configuration to deploy the resources:

   ```
    terraform apply
   ```

   Confirm the action by typing yes when prompted.

## Cleaning Up

To remove the deployed resources, navigate to the environment directory and run:


   ```
    terraform destroy
   ```

Confirm the action by typing yes when prompted.