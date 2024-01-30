  
resource "azurerm_subnet" "subnet" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_space
  
    dynamic "delegation" {
    for_each = { for delegation in var.subnet_delegation: delegation.name => delegation.subnet_delegation }
    content {
      name = delegation.key
      dynamic "service_delegation" {
        for_each ={ for delegations in delegation.value : delegations.name => delegations }
        content {
          name    = service_delegation.value.name
          actions = service_delegation.value.actions
        }
      }
    }
  } 
}
  

