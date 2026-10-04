
variable "landing-lb" {
  type = map(object({
    lb_name      = string
    PublicIP_name =string
    location = string
    rg_name  = string

  }))
}

variable "nic" {
  type = map(object({
    nic_name = string
    rg_name   = string
  }))
}





