resource "azurerm_network_interface" "linux-vm-nic" {
  for_each = var.nics

  name                = "${var.hostname}-${each.key}"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  ip_configuration {
    name                          = each.value.name
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = each.value.private_ip_address
    public_ip_address_id          = each.value.public_ip_address_required ? azurerm_public_ip.linux-vm-public-ip[each.key].id : null
  }
}

resource "azurerm_public_ip" "linux-vm-public-ip" {
  for_each = {
    for k, v in var.nics : k => v if v.public_ip_address_required
  }
  name                = "${var.hostname}-public-ip-${each.key}"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  allocation_method   = "Static"
}