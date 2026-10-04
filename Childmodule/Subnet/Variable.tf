variable "subnet" {
  type = map(object({
    rg_name  = string
    vnet_name = string
    location             = string
    subnet_name          = string
    address_prefixes     = list(string)

  }))

}