variable "vnet" {
    type = map(object({
    rg_name = string
    location= string
    vnet_name= string
    address_space= list(string)

    }))
  
}