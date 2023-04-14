resource "azurerm_key_vault" "example" {
  name                = "tg-key-${var.environment}${random_integer.rnd_int.result}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "premium"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "create",
      "get",
    ]
    secret_permissions = [
      "set",
    ]
  }
  tags = {
    environment          = var.environment
    git_file             = "terraform/azure/key_vault.tf"
  }
}

resource "azurerm_key_vault_key" "generated" {
  name         = "tg-generated-certificate-${var.environment}"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
  tags = {
    git_file             = "terraform/azure/key_vault.tf"
  }
}

resource "azurerm_key_vault_secret" "secret" {
  key_vault_id = azurerm_key_vault.example.id
  name         = "tg-secret-${var.environment}"
  value        = random_string.password.result
  tags = {
    git_file             = "terraform/azure/key_vault.tf"
  }
}