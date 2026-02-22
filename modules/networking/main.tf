resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnets
    name                = each.value.virtual_network_name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    address_space       = each.value.address_space
    dns_servers         = each.value.dns_servers

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.nsg[each.key].id
  }

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_security_group" "nsg" {
    for_each = var.vnets
  name                = each.value.network_security_group_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

    security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

