module "rg" {
  source = "../../modules/azurerm_resource_group"
rgs = var.rgs
}

module "network" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_networks"
  networks = var.networks

}

module "pip" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_public_ip"
  pips = var.pips

}

module "linux_compute" {
  depends_on = [ module.network,module.pip ]
  source = "../../modules/azurerm_linux_virtual_machine"
  vms = var.vms

}


module "sql_server" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_sql_server"
  sql_servers = var.sql_servers

}


module "sql_db" {
  depends_on = [ module.sql_server ]
  source = "../../modules/azurerm_sql_database"
  dbs = var.dbs

}


module "lb" {
  depends_on = [ module.pip ]
  source = "../../modules/azurerm_lb"
  lbs = var.lbs

}

module "nic2bapassociation" {
  depends_on = [ module.linux_compute,module.lb ]
  source = "../../modules/azurerm_nic_bap_association"
  nictobaps = var.nictobaps

}
