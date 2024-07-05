# Settings Block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.74.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

/*
# Terraform Provider Block
provider "azurerm" {
  features {}
  subscription_id = "xxxx-xxxxxxx-xxxxxxxx-xxxxx-xxxx"
  client_id       = "xxxx-xxxxxxx-xxxxxxxx-xxxxx-xxxx"
  client_secret   = "xxxx-xxxxxxx-xxxxxxxx-xxxxx-xxxx"
  tenant_id       = "xxxx-xxxxxxx-xxxxxxxx-xxxxx-xxxx"
}
*/

# Terraform Modules Block (Exemplo de utilização de módulo)
module "storage_module" {
  source = "./storage_module"
}

# Terraform Output Values Block STORAGE
output "storage_account_id" {
  value = module.storage_module.storage_account_id
}

# Module Resource Group (Import)
module "rg_module" {
  source = "./resource_group"
}

# Module Public IP (Import)
module "pip_module" {
  source = "./public_ip"
}

# Module Dns Zone
module "dns_zone_module" {
  source   = "./dns_zone"
  dns_name = "tfteclab.com.br"
  rg_name  = module.rg_module.rg_name_import

  depends_on = [
    module.rg_module
   ]
}

# Terraform Output Values Block DNS
output "dns_id" {
  value = module.dns_zone_module.dns_id
}

#Module Terraform Registry
module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.1"
  suffix = [ "tftec" ]
}

resource "azurerm_resource_group" "rg_naming_module" {
  name     = module.naming.resource_group.name_unique
  location = "West Europe"
}