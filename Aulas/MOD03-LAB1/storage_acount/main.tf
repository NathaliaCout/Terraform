
# Data Block
data "azurerm_resource_group" "rg-portal" {
  name = "rg-tftec-data-block-portal"
}

# Local Variables Block
locals {
  storage_account_sku = "Standard"
}

# Resource Block
resource "azurerm_storage_account" "storage_tftec" {
  name                     = "stg001tftecterraform"
  resource_group_name      = data.azurerm_resource_group.rg-portal.name
  location                 = data.azurerm_resource_group.rg-portal.location
  account_tier             = local.storage_account_sku
  account_replication_type = var.account_replication_type

  tags = {
    environment = "staging"
  }
}

# Variables Block
variable "account_replication_type" {
  description = "Tipo de replica da storage account"
  type        = string
  default     = "GRS"
}

# Outputs Block
output "storage_account_id" {
  value = azurerm_storage_account.storage_tftec.id
}
