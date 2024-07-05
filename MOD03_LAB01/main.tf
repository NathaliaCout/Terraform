# settings block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.102.0"
    }

        random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

/* 
provider "azurerm" {
Configuration options
 features {  }
  subscription_id = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  client_id       = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  client_secret   = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  tenant_id       = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 
}
*/

#Module block
module "storage_module" {
  source = "./storage_account"
}

#Outputs block
output "storage_account_id" {
  value = module.storage_module.storage_account_id
}