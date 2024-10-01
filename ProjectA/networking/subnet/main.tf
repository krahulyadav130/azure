resource "azurerm_subnet" "websubnet" {
    name = var.subnetname
    virtual_network_name = var.vnetname
    resource_group_name =  var.rsg-name
    address_prefixes = var.subnetaddress
    

  
}
