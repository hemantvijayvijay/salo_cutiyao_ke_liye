module "rg" {
  source = "../../module/resource_group"
  rg     = var.rg1
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../module/virtual_network"
  vnet       = var.vnet1
}
module "subnet" {
  depends_on = [module.vnet]
  source     = "../../module/subnet"
  subnet     = var.subnet1
}
module "nsg" {
  depends_on = [module.subnet]
  source     = "../../module/nsg"
  nsg        = var.nsg1
}

module "assocate" {
  depends_on = [module.subnet, module.nsg]
  source     = "../../module/subnet_nsg_association"
  assocate   = var.assocate1

}

module "pip" {
  depends_on = [module.rg]
  source     = "../../module/public_ip"
  pip        = var.pip1
}
module "vm" {
  depends_on = [module.rg, module.pip, module.vnet, module.subnet]
  source     = "../../module/virtual_machine"
  vm         = var.vm1
}

module "win-vm" {
  depends_on = [module.rg, module.nsg, module.subnet, module.subnet]
  source     = "../../module/Windwos_machine"
  win-vm     = var.win-vm

}
module "bastion" {
  depends_on = [module.rg, module.subnet]
  source     = "../../module/Bastion"
  bastion    = var.bastion

}
module "vent-peering" {
  depends_on   = [module.rg, module.vnet]
  source       = "../../module/Vnet_peering"
  vnet-peering = var.vnet-peering


}