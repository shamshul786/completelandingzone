variable "nic" {
    type = map(object({
    nic_name= string  
    rg_name= string
    public_ip_name= string
    location= string
    subnet_name= string
    vnet_name= string

    }))
  
}
