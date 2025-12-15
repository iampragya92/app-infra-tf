data "azurerm_network_interface" "nic" {
  for_each = var.nictobaps
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}


data "azurerm_lb" "lb" {
   for_each = var.nictobaps
  name                = each.value.lb_name
  resource_group_name = each.value.rg_name
}

data "azurerm_lb_backend_address_pool" "bap" {
  for_each = var.nictobaps
  name            = each.value.backend_address_pool_name
  loadbalancer_id = data.azurerm_lb.lb[each.key].id
}



resource "azurerm_network_interface_backend_address_pool_association" "nictobaplink" {
  for_each = var.nictobaps
  network_interface_id    = data.azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.bap[each.key].id
}
