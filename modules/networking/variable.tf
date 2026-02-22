variable "vnets" {
    type = map(object({
        virtual_network_name = string
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

