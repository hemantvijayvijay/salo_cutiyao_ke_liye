data "azurerm_virtual_network" "source" {
  for_each            = var.vnet-peering
  name                = each.value.source_vnet  
  resource_group_name = each.value.resource_group_name

}

data "azurerm_virtual_network" "destination" {
  for_each            = var.vnet-peering
  name                = each.value.destination_vnet  
  resource_group_name = each.value.resource_group_name

}