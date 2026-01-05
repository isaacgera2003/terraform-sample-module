resource "azurerm_network_security_group" "isaac-nsg" {
  name                = "isaac-nsg"
  location            = azurerm_resource_group.isaac-rg.location
  resource_group_name = azurerm_resource_group.isaac-rg.name
  tags                = local.tags
  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "isaac-nsg-association" {
  subnet_id                 = azurerm_subnet.isaac-subnet-0.id
  network_security_group_id = azurerm_network_security_group.isaac-nsg.id
}