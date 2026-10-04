variable "nsg_nic_ids" {
  type = map(object({
    nic_name = string
    nsg_name = string
    rg_name  = string
  }))
}