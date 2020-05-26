dependency "application" {
  config_path = "../application"
  mock_outputs = {
    resource_group_name              = "realworld-demo-test"
    sql_server_name                  = "realworld-demo-test"
    backend_app_service_ip_addresses = ["0.0.0.0"]
  }
}

inputs = {
  resource_group_name       = dependency.application.outputs.resource_group_name
  sql_server_name           = dependency.application.outputs.sql_server_name
  sql_firewall_ip_addresses = dependency.application.outputs.backend_app_service_ip_addresses
}