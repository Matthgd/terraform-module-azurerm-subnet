  
resource "azurerm_subnet" "subnet" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_space
    dynamic "delegation_subnet" {
        for_each = (var.delegation ==null ? {} : var.delegation)
        content {
           name =  delegation_subnet.value.name
        }
    }
    dynamic "service_delegation" {
        for_each = (var.service_delegation ==null ? {} : var.service_delegation)
        content {
           name =  service_delegation.value.name
           actions = service_delegation.value.actions
        }
    }
  delegation {
    name = delegation_subnet.value.name
    service_delegation {
      name    = service_delegation.value.name
      actions = service_delegation.value.actions
    }  
}
  }

