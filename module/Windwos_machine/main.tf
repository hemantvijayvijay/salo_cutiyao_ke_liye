resource "azurerm_network_interface" "win-nic" {
    for_each =var.win-vm
    name=each.value.nic_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
  
  name=each.value.ipconfiguration_name
  subnet_id = data.azurerm_subnet.subnet[each.key].id
  private_ip_address_allocation =each.value.private_ip_address_allocation
  }
}

resource "azurerm_windows_virtual_machine" "win-vm" {
    for_each = var.win-vm
    name= each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  size = each.value.size
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  network_interface_ids = [azurerm_network_interface.win-nic[each.key].id]
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}