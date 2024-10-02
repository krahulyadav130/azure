resource "azurerm_public_ip" "pip" {
    name = var.pipname
    location = var.location
    resource_group_name = var.rsgname
    allocation_method = "Static"
  
}