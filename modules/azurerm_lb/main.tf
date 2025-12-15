data "azurerm_public_ip" "lb_pip" {
  for_each            = var.lbs
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name

}

resource "azurerm_lb" "lb" {
  for_each            = var.lbs
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration.name
    public_ip_address_id = data.azurerm_public_ip.lb_pip[each.key].id
  }
}




resource "azurerm_lb_backend_address_pool" "pool1" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.backend_pool_name
}



resource "azurerm_lb_probe" "probe" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.probe_name
  port            = each.value.probe_port_number
}




resource "azurerm_lb_rule" "rule1" {
  for_each                       = var.lbs
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = each.value.lb_rule_name
  protocol                       = each.value.protocol
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_ip_configuration.name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.pool1[each.key].id]
  probe_id                       = azurerm_lb_probe.probe[each.key].id
}



