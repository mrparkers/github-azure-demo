# Environment Bootstrap Terraform

Terraform plan to bootstrap Azure resources. It creates storage for Terraform state for the [Application Terraform](../terraform/README.md) and resource groups for _prod_ and _preview_ environments.

Resources
  - Resource Group: `github-workshop` - Contains storage for Terraform state
  - Resource Group: `github-workshop-prod` - Production environment for realworld app
  - Resource Group: `github-workshop-preview` - Preview environment for realworld app
  - Storage Account: `githubworkshop`
  - Storage Container: `tfstate` - Remote storage to Terraform backend

## Setup

To bootstrap the environment you must be logged into the Azure account with the CLI

```
az login
```

Run Terraform plan

```
terraform apply
```

## Storage access key

To use the storage with the Terraform azurerm backend you need the access key which you cat get from the Terraform state.

```
terraform show -json | jq '.values.root_module.resources[] | select( .type == "azurerm_storage_account" and .name == "storage_account") .values.primary_access_key'
```

See the [Application Terraform](../terraform/README.md) for an example using the access key.