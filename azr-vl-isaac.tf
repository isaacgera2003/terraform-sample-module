module "virtual_machines" {
  source                     = "./modules"
  hostname                   = "azr-vl-isaac"
  resource_group_name        = azurerm_resource_group.isaac-rg.name
  location                   = azurerm_resource_group.isaac-rg.location
  tags                       = local.tags
  size                       = "Standard_B1s"
  admin_username             = var.admin_username
  admin_password             = var.admin_password
  sku                        = "8_6"

  data_disks = {
    datadisk-0 = {
      lun                  = 0
      disk_size_gb         = 14
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    # datadisk-1 = {
    #   lun                  = 1
    #   disk_size_gb         = 10
    #   caching              = "ReadWrite"
    #   storage_account_type = "Standard_LRS"
    # }
  }

  nics = {
    nic-0 = {
      name = "internal"
      subnet_id = azurerm_subnet.isaac-subnet-0.id
      private_ip_address = "10.0.1.10"
      public_ip_address_required = true
    }
    # nic-1 = {
    #   name = "internal1"
    #   subnet_id = azurerm_subnet.isaac-subnet-0.id
    #   private_ip_address = "10.0.1.20"
    #   public_ip_address_required = false
    # }
  }
}