module "rg" {
  source = "../../Childmodule/Resourcegroup"
  rg     = var.rg

}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../Childmodule/Virtualnetwork"
  vnet       = var.vnet
}
module "subnet" {
  depends_on = [module.vnet]
  source     = "../../Childmodule/Subnet"
  subnet     = var.subnet

}
module "database" {
  depends_on = [module.server]
  source     = "../../Childmodule/SQLdatabase"
  database   = var.database

}
module "server" {
  depends_on = [module.rg]
  source     = "../../Childmodule/SQLserver"
  sqlserver  = var.sqlserver

}
module "nsg" {
  depends_on = [module.rg]
  source     = "../../Childmodule/NSG"
  nsg        = var.nsg
}
module "nic" {
  depends_on = [module.subnet]
  source     = "../../Childmodule/NIC_PIP"
  nic        = var.nic
}


module "nsg_nic_assoc" {
  depends_on  = [module.nic, module.nsg]
  source      = "../../Childmodule/NIC_NSG_Associate"
  nsg_nic_ids = var.nsg_nic_ids

}
module "vm" {
  depends_on = [module.nic, module.keyvaults]
  source     = "../../Childmodule/VirtualMachine"
  vm         = var.vm
  keyvaults  = var.keyvaults
  secrets    = var.secrets
}


module "keyvaults" {
  depends_on = [module.rg]
  source     = "../../Childmodule/Key_Vault"
  keyvaults  = var.keyvaults
  secrets    = var.secrets
}

# module "PublicIP" {
#   depends_on = [ module.rg ]
#   source = "../../Childmodule/Loadbalancer"
#   PublicIP            = var.landing-lb
# }

 module "landing-lb" {
   depends_on = [module.rg,module.nic]
   source     = "../../Childmodule/Loadbalancer"
   landing-lb = var.landing-lb
   nic = var.nic

}


