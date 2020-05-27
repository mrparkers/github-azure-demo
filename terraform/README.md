Terraform plans to deploy the resources to run the realworld demo application. The plans need an Azure storage container for the backend state and a resource group to deploy the application in (See [Bootstrap Terraform](../terraform-bootstrap)).

*Resources*
 - App Service Plan
 - App Service 
 - SQL Server
 - SQL Database 
 - SQL Server Firewall Rules

The resources are split into two different Terraform plans because the number of firewall rules is initially unknown as they depend on the IP addresses created for the app service. 

*Environment Variables*
 - `ARM_ACCESS_KEY`: Access key for the Azure storage account. Required for Terraform backend.
 - `ENVIRONMENT`: Which environment to deploy to (_prod_|_preview_)
 - `BRANCH`: In the preview environment this should be the name of the branch being previewed. In prod this should be _master_.

Terragrunt used to run the Terraform plans and manage the dependencies. From this folder you can run the follow commands to plan, deploy and destroy an environment:

```
ARM_ACCESS_KEY="STORAGE_ACCESS_KEY" ENVIRONMENT="prod" BRANCH="master" terragrunt plan-all
ARM_ACCESS_KEY="STORAGE_ACCESS_KEY" ENVIRONMENT="prod" BRANCH="master" terragrunt apply-all
ARM_ACCESS_KEY="STORAGE_ACCESS_KEY" ENVIRONMENT="prod" BRANCH="master" terragrunt destroy-all
```