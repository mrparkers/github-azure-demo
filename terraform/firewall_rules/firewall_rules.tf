resource "azurerm_sql_firewall_rule" "sql_firewall_rule" {
  for_each            = var.sql_firewall_ip_addresses
  name                = "realworld-app-${each.key}"
  resource_group_name = var.resource_group_name
  server_name         = var.sql_server_name
  start_ip_address    = each.value
  end_ip_address      = each.value
}