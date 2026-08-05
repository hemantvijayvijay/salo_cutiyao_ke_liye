resource "azurerm_virtual_network_peering" "vnet-peering" {
  for_each                     = var.vnet-peering
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  virtual_network_name         = data.azurerm_virtual_network.source[each.key].name
  remote_virtual_network_id    = data.azurerm_virtual_network.destination[each.key].id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

}

