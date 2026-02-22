variable "rgs" {
    type = map(object({
        name     = string
        location = string
        tags     = map(string)
    }))
}
variable "stgs" {
    type = map(object({
        azurerm_storage_account_name = string
        resource_group_name         = string
        location                    = string
        account_tier                = string
        account_replication_type    = string
        tags                        = map(string)
    }))
}

variable "vnets" {
    type = map(object({
        virtual_network_name               = string
        address_space       = list(string)
        location            = string
        resource_group_name = string
        network_security_group_name = string
        dns_servers = list(string)
        tags                = map(string)
        subnet            = map(object({
            subnet_name          = string
            address_prefixes = list(string)
        }))
    }))
}

variable "vms" {
  type = map(object({
    nic_name             = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
    vm_name              = string
    vm_size              = string

    ip_configuration = map(object({
      ip_configuration_name         = string
      private_ip_address_allocation = string
      private_ip_address            = optional(string)
    }))
  }))
}