variable "nsg" {
  description = "Network Security Group configuration"
  type = map(object({
    nsg_name             = string
    location             = string
    rg_name            = string
 }))
  }