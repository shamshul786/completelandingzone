variable "rg" {
  description = "Map of Resource Groups with environment and owner tags"
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = optional(string)
  }))
}
variable "vnet" {
  type = map(object({
    vnet_name     = string
    rg_name       = string
    location      = string
    address_space = list(string)

  }))

}


variable "subnet" {
  type = map(object({
    rg_name          = string
    vnet_name        = string
    location         = string
    subnet_name      = string
    address_prefixes = list(string)

  }))

}
variable "database" {
  type = map(object({
    database_name  = string
    rg_name        = string
    server_name    = string
    collation      = string
    license_type   = string
    max_size_gb    = string
    read_scale     = string
    sku_name       = string
    zone_redundant = string
  }))

}
variable "sqlserver" {
  type = map(object({

    sqlserver_name               = string
    rg_name                      = string
    version                      = string
    location                     = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
  }))

}

variable "nsg" {
  description = "Network Security Group configuration"
  type = map(object({
    nsg_name = string
    location = string
    rg_name  = string
  }))
}

variable "nic" {
  type = map(object({
    nic_name       = string
    rg_name        = string
    public_ip_name = string
    location       = string
    subnet_name    = string
    vnet_name      = string

  }))

}


variable "vm" {
  type = map(object({
    vm_name         = string
    size            = string
    nic_name        = string
    rg_name         = string
    location        = string
    admin_username  = optional(string)
    admin_password  = optional(string)
    kv_name         = optional(string)
    username_secret = optional(string)
    password_secret = optional(string)
  }))

}


# variable "keyvaults" {}
variable "secrets" {}

variable "nsg_nic_ids" {
  type = map(object({
    nic_name = string
    nsg_name = string
    rg_name  = string
  }))
}
variable "keyvaults" {
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    sku_name = string
  }))
}

variable "landing-lb" {
  type = map(object({
    lb_name           = string
    PublicIP_name = string
    location      = string
    rg_name       = string

  }))
}


