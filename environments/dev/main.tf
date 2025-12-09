module "rg" {
  source = "../../modules/azurerm_resource_group"
rgs = var.rgs
}

module "network" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_networks"
  networks = var.networks

}
