variable "name" {
  default = "flywheel"
}

variable "resource_group_name" {}

variable "sql_server_name" {}

variable "sql_firewall_ip_addresses" {
  type = set(string)
}
