# Resource Group Import without automatic code generation 
import {
  to = module.rg_module.azurerm_resource_group.rg-import
  id = "/subscriptions/6cc406ed-9e67-47e8-8c56-34d05ac13a13/resourceGroups/rg-tftec-import-portal"
}



# Public IP Import with automatic code generation 
import {
  to = module.pip_module.azurerm_public_ip.pip-tftec-import
  id = "/subscriptions/6cc406ed-9e67-47e8-8c56-34d05ac13a13/resourceGroups/rg-tftec-import-portal/providers/Microsoft.Network/publicIPAddresses/pip-tfetec-import-portal"
}