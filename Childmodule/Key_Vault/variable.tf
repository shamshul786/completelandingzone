variable "keyvaults" {
  type = map(object({
    name                = string
    location            = string
    rg_name             = string
    sku_name            = string
  }))
}

variable "secrets" {
  type = map(object({
    name         = string
    value        = string
    keyvault_key = string
  }))
}
