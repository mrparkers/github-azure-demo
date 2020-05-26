resource "azurerm_resource_group" "resource_group" {
  name     = "github-workshop-${var.name}"
  location = var.location
}
