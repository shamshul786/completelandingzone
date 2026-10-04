variable "database" {
    type = map(object({
    database_name = string
    rg_name= string
    server_name= string
    collation= string
    license_type= string
    max_size_gb= string
    read_scale = string
    sku_name= string
    zone_redundant= string
    }))
  
}