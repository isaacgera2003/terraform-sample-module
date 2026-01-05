resource "azurerm_virtual_network" "isaac-vnet" {
  name                = "isaac-vnet"
  resource_group_name = azurerm_resource_group.isaac-rg.name
  location            = azurerm_resource_group.isaac-rg.location
  address_space       = ["10.0.0.0/16"]
  tags                = local.tags
}

resource "azurerm_subnet" "isaac-subnet-0" {
  name                 = "isaac-subnet-0"
  resource_group_name  = azurerm_resource_group.isaac-rg.name
  virtual_network_name = azurerm_virtual_network.isaac-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}