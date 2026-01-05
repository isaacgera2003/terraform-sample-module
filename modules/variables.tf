variable "hostname" {
  type        = string
  description = "Server name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "size" {
  type        = string
  description = "VM Size"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "admin_username" {
  type        = string
  description = "Admin username"
  sensitive   = true
}

variable "admin_password" {
  type        = string
  description = "Admin password"
  sensitive   = true
}

variable "private_ip_address" {
  type        = string
  description = "Private IP Address"
}

variable "sku" {
  type        = string
  description = "sku redhat version"
}

variable "os_disk_size_gb" {
  type        = number
  default     = 64
  description = "OS disk size in GB"
}

variable "data_disks" {
  type = map(object({
    lun                  = number
    disk_size_gb         = number
    storage_account_type = string
    caching              = string
  }))
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "nics" {
  type = map(object({
    name = string
    subnet_id = string
    private_ip_address = string
    public_ip_address_required = bool
  }))
}