data "azurerm_client_config" "current" {}

resource "azurerm_key_vault_secret" "secret" {

  for_each = var.secrets

  name         = each.value.name
  value        = each.value.value
  key_vault_id = azurerm_key_vault.keyvaults[each.value.keyvault_key].id

}



resource "azurerm_key_vault" "keyvaults" {
  for_each                    = var.keyvaults
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.rg_name
  sku_name                    = each.value.sku_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
    "Create",
    "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]

  }
}