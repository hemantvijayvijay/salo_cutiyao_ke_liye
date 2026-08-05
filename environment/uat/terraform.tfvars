rg1 = {
  rg1 = {
    name     = "rg-derewala"
    location = "westus"
  }

}


vnet1 = {
  vnet1 = {
    name                = "spoke-vnet"
    location            = "westus"
    resource_group_name = "rg-derewala"
    address_space       = ["10.0.0.0/16"]
  }

  vnet2 = {
    name                = "hub-vnet"
    location            = "westus"
    resource_group_name = "rg-derewala"
    address_space       = ["10.1.0.0/16"]
  }

  vnet3 = {
    name                = "hub1-vnet"
    location            = "westus"
    resource_group_name = "rg-derewala"
    address_space       = ["10.2.0.0/16"]
  }

  vnet4 = {
    name                = "hub2-vnet"
    location            = "westus"
    resource_group_name = "rg-derewala"
    address_space       = ["10.3.0.0/16"]
  }
}

subnet1 = {
  subnet1 = {
    name                 = "app-subnet"
    resource_group_name  = "rg-derewala"
    virtual_network_name = "spoke-vnet"
    address_prefixes     = ["10.0.1.0/24"]
    nsg_name             = "spoke-nsg"

  }

  subnet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-derewala"
    virtual_network_name = "spoke-vnet"
    address_prefixes     = ["10.0.2.0/24"]
    nsg_name             = "spoke-nsg"

  }
}

pip1 = {
  pip1 = {
    name                = "app-pip"
    resource_group_name = "rg-derewala"
    location            = "westus"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "bastion-pip"
    resource_group_name = "rg-derewala"
    location            = "westus"
    allocation_method   = "Static"
  }
}

vm1 = {
  vm1 = {
    nic_name                        = "app-nic"
    location                        = "westus"
    subnet_name                     = "app-subnet"
    resource_group_name             = "rg-derewala"
    virtual_network_name            = "spoke-vnet"
    pip_name                        = "app-pip"
    vm_name                         = "frontend-vm"
    size                            = "Standard_D2s_v3"
    admin_username                  = "hemant"
    admin_password                  = "Mumbai@1234!"
    disable_password_authentication = "false"


  }
}
nsg1 = {
  nsg1 = {
    name                       = "spoke-nsg"
    location                   = "westus"
    resource_group_name        = "rg-derewala"
    security_rule_name         = "nsg"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

assocate1 = {
  subnet1 = {
    subnet_name          = "app-subnet"
    virtual_network_name = "spoke-vnet"
    resource_group_name  = "rg-derewala"
    nsg_name             = "spoke-nsg"
  }
}

win-vm = {
  win-vm1 = {
    nic_name                      = "win-nic1"
    location                      = "westus"
    resource_group_name           = "rg-derewala"
    ipconfiguration_name          = "win-ipconf"
    name                          = "app-vm"
    subnet_name                   = "app-subnet"
    virtual_network_name          = "spoke-vnet"
    private_ip_address_allocation = "Dynamic"
    size                          = "Standard_D2s_v3"
    admin_username                = "hemant"
    admin_password                = "Mumbai@1234!"


  }
}

bastion = {
  bastion1 = {
    name                 = "bastion"
    location             = "westus"
    resource_group_name  = "rg-derewala"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "spoke-vnet"
    pip_name             = "bastion-pip"
  }
}

vnet-peering = {
  peering1 = {
    source_vnet         = "spoke-vnet"
    destination_vnet    = "hub-vnet"
    resource_group_name = "rg-derewala"
    name                = "spoke-to-hub-peering"
  }

  peering2 = {
    source_vnet         = "hub-vnet"
    destination_vnet    = "spoke-vnet"
    resource_group_name = "rg-derewala"
    name                = "hub-to-spoke-peering"
  }


  peering3 = {
    source_vnet         = "hub1-vnet"
    destination_vnet    = "hub2-vnet"
    resource_group_name = "rg-derewala"
    name                = "hub3-to-hub4-peering"
  }

  peering4 = {
    source_vnet         = "hub2-vnet"
    destination_vnet    = "hub1-vnet"
    resource_group_name = "rg-derewala"
    name                = "hub4-to-hub3-peering"
  }
}