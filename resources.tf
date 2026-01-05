resource "azurerm_resource_group" "isaac-rg" {
  name     = "isaac-rg"
  location = "southindia"
  tags     = local.tags
}