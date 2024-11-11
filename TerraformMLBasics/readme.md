# Basics of Terraform for Azure Machine Learning
In this example we deploy all the resources needed for creating an Azure Machine Learning workspace and other resources in Terraform.

## Terraform
Infrastructure as Code (IaC) is a set of common patterns used for create infrassture in Public Cloud services. 

## Resources used
In this Azure example we deploy a few resources needed for Azure Machine Learning Workspace.
- Azure Storage Account
- Azure Key Vault
- Azure Application Insights
- Azure Machine Learning

**Note this is a demo for public endpoint not a private workspace**

## Requirements
- [Terraform](https://developer.hashicorp.com/terraform/install)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Azure Subscription](https://azure.microsoft.com/en-us/pricing/purchase-options/azure-account)

No experience needed. Download the repo to get started.

## Build the Workspace
1) Sign into Azure CLI from the terminal by running `az login` and confirm your subscription.
2) In the TerraformMLBasics directory run `terraform init` to initialize code.
3) Then run `terraform plan` to check if the code will compile for resource generation.
4) Once it has been created `terraform apply --yes`. This will create your resources.
5) Final step once you have views the resources and are satisfied. Delete the resources by running `terraform destroy --yes`.

## Congrats you build your first IaC for ML
You are one step closer to building a full set of MLOps.