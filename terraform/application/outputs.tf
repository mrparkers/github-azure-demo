output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
}

output "sql_server_name" {
  value = azurerm_sql_server.sql_server.name
}

output "backend_app_service_ip_addresses" {
  value = split(",", azurerm_app_service.app_service.possible_outbound_ip_addresses)
}