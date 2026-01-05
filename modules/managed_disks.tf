resource "azurerm_managed_disk" "linux-vm-disks" {
  for_each             = var.data_disks
  name                 = "${var.hostname}-${each.key}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = each.value.storage_account_type
  disk_size_gb         = each.value.disk_size_gb
  create_option        = "Empty"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "linux-vm-datadisk-attachment" {
  for_each           = var.data_disks
  managed_disk_id    = azurerm_managed_disk.linux-vm-disks[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.linux-vm.id
  lun                = each.value.lun
  caching            = "ReadWrite"
}