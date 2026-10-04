variable "sqlserver" {
    type = map(object({

    sqlserver_name= string
    rg_name= string
    version= string
    location= string
    administrator_login = string
    administrator_login_password= string
    minimum_tls_version = string
    }))
  
}