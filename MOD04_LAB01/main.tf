# Settings Block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.74.0"
    }

    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

# Terraform Provider Block
//provider "azurerm" {
//  features {}
//  subscription_id = "xxxx-xxxxxxx-xxxxxxxx-xxxxx-xxxx"
//  client_id       = "xxxx-xxxxxxx-xxxxxxxx-xxxxx-xxxx"
//  client_secret   = "xxxx-xxxxxxx-xxxxxxxx-xxxxx-xxxx"
//  tenant_id       = "xxxx-xxxxxxx-xxxxxxxx-xxxxx-xxxx"
//}

# Terraform Modules Block (Exemplo de utilização de módulo)
module "storage_module" {
  source = "./storage_module"
}

# Terraform Output Values Block
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