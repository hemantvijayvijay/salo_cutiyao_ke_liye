data "azurerm_subnet" "subnet" {
  for_each             = var.win-vm
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}