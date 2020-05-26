Terraform plans to setup Azure environment to deploy the realworld demo to.

Resources
 - Resource Group
 - App Service Plan
 - App Service 
 - SQL Server
 - SQL Database 
 - SQL Server Firewall Rules

The resources are split into two different Terraform plans because the number of firewall rules is initially unknown as they depend on the IP addresses created for the app service. 

Terragrunt manages to Terrform plans. From this folder you can run the follow commands to plan, deploy and destroy an environment:

```
terragrunt plan-all -var name=ENVIRONMENT_NAME
terragrunt apply-all -var name=ENVIRONMENT_NAME
terragrunt destroy-all -var name=ENVIRONMENT_NAME
```