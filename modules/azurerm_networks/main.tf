resource "azurerm_virtual_network" "network" {
 for_each = var.networks
 name = each.value.vnet_name
 location = each.value.location
 resource_group_name = each.value.rg_name
 address_space = each.value.vnet_cidr

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
       name             = subnet.value.subnet_name
    address_prefixes = subnet.value.subnet_cidr
    }

  }
}
