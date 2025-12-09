resource "azurerm_mssql_server" "sql_server" {
  for_each = var.sql_servers
  name                         = each.value.sql_server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.sql_admin
  administrator_login_password = each.value.sql_password
  minimum_tls_version          = "1.2"

 
}
