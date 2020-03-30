# GitHub Actions CI/CD

This repository is configured to utilize GitHub Actions for Continuous Integration and Continuous Deployment to an Azure Web Service for public viewing. The infrastructure used for the deployment was created using Infrastructure-as-Code (IaC) and provisioned using Terraform. To replicate the infrastructure setup, you need to provide:
    - An Azure subscription
    - An existing Azure Storage Account acting as the Terraform backend
    - Secrets stored within GitHub, used within Actions

## Create Storage Account
If you do not have an existing Azure Storage Account, you can create one using the Azure CLI by following these steps (adapted from [here](https://docs.microsoft.com/en-us/azure/terraform/terraform-backend)):


```
#!/bin/bash

RESOURCE_GROUP_NAME=tfstate-rg
STORAGE_ACCOUNT_NAME=tfstate$RANDOM
CONTAINER_NAME=tfstate

# Login to Azure
az login

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location centralus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query [0].value -o tsv)

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"
```


## Set Environment Variables

To configure Terraform to use your Azure AD service principal, set the following environment variables, which are then used by the Azure Terraform modules. You can also set the environment if working with an Azure cloud other than Azure public.

- ARM_SUBSCRIPTION_ID
- ARM_CLIENT_ID
- ARM_CLIENT_SECRET
- ARM_TENANT_ID
- ARM_ENVIRONMENT

You can use the following sample shell script to set those variables:

    echo "Setting environment variables for Terraform"
    export ARM_SUBSCRIPTION_ID=your_subscription_id
    export ARM_CLIENT_ID=your_appId
    export ARM_CLIENT_SECRET=your_password
    export ARM_TENANT_ID=your_tenant_id
