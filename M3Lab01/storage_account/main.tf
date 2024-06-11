# Data block
data "azurerm_resource_group" "rg-portal" {
  name = "rg-ttftec-data-block-portal"
}

# Local Variables block
locals {
  storage_account_sku = "Standard"
}

# Resource Block
resource "azurerm_storage_account" "storage_tftec" {
  name                     = "sttfftec${random_string.random.result}"
  resource_group_name      = data.azurerm_resource_group.rg-portal.name
  location                 = data.azurerm_resource_group.rg-portal.location
  account_tier             = local.storage_account_sku
  account_replication_type = var.account_replication_type

  tags = {
    environment = "staging"
  }
}

#variables block  = variaveis de entrada
variable "account_replication_type" {
  description = "Tipo de replica da storage account"
  type        = string
  default     = "GRS"
}

#Outputs block
output "storage_account_id" {
  value = azurerm_storage_account.storage_tftec.id
}

#Random Block
resource "random_string" "random" {
  length           = 5
  special          = false
  upper = false

}
