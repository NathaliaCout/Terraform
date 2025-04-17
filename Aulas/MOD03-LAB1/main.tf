
# Settings Block
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
}

# Provider Block
//provider "azurerm" {

#features { 
//}
//}

# Module Block
module "storage_module" {
  source = "./storage_acount"

}

# Outputs Block
output "storage_account_id" {
  value = module.storage_module.storage_account_id
}
