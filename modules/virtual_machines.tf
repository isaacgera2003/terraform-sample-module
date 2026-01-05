resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                            = var.hostname
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  tags                            = var.tags
  disable_password_authentication = false
  network_interface_ids = [
    for nic_key in keys(var.nics) : azurerm_network_interface.linux-vm-nic[nic_key].id
  ]

  os_disk {
    name                 = "${var.hostname}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = var.os_disk_size_gb
  }
  
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = var.sku
    version   = "latest"
  }
}