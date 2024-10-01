
resource "azurerm_virtual_network" "vnet" {
    name = var.vnetname
    location = var.location
    address_space = var.vnet-ip
    resource_group_name = var.rsg-name
  
}
