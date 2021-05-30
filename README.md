# IaC And Cloud Security Tech Test

# Part A. Explanation of the files
# cloudnat.tf - Terraform files to create Cloud Router & Cloud NAT
# gke.tf - Terraform files to create K8S Cluster
# iam.tf - Terraform files to create Service Account
# network.tf - Terraform files to create Custom Network & Subnet
# terraform.tfvars - Terraform Input Variable
# variable.tf - Terraform Variable Definitation
# versions.tf - Specify Terraform version constraints. 


# Part B. How to run the code

# Step 1. Authorizing Cloud SDK tools
gcloud auth login

# Step 2. Set the GCP Project - YOUR_PROJECT_ID is the project ID to create the cluster
gcloud projects list
gcloud config set project YOUR_PROJECT_ID

# Step 3. Enable the GCP API
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com

# Step 4. Update the Terraform Input Variable in the file terraform.tfvars: Please update the project. Other items can keep unchange
sed -i 's/plasma-inquiry-315318/YOUR_PROJECT_ID/g' terraform.tfvars

# Step 5. Initialize a working directory containing Terraform configuration files
terraform init

# Step 6. Apply the Terraform configuration files to create the objects. Reply yes to create
terraform apply
