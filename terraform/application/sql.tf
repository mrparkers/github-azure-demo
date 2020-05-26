resource "random_password" "sql_admin_pasword" {
  length = 16
}

resource "azurerm_sql_server" "sql_server" {
  name                = "realworld-demo-${var.name}"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  version             = "12.0"

  administrator_login          = "realworld-admin"
  administrator_login_password = random_password.sql_admin_pasword.result

  tags = local.tags
}

resource "azurerm_sql_database" "sql_database" {
  name                = "realworld"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  server_name         = azurerm_sql_server.sql_server.name

  tags = local.tags
}
