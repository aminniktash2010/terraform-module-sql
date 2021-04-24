resource "azurerm_sql_server" "sqldb" {
  name                         = var.sql_server_name
  resource_group_name          = "sql"
  location                     = "canadacentral"
  version                      = "12.0"
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_sql_database" "db" {
  name                = var.sql_database_name
  resource_group_name = "sql"
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqldb.name
}
 