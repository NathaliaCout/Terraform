resource "azurerm_public_ip" "pip-tftec-import" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  ddos_protection_plan_id = null
  domain_name_label       = null
  edge_zone               = null
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = "eastus"
  name                    = "pip-tfetec-import-portal"
  public_ip_prefix_id     = null
  resource_group_name     = "rg-tftec-import-portal"
  reverse_fqdn            = null
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {
    funciona = "SIM"
  }
  zones                   = ["1", "2", "3"]
}
