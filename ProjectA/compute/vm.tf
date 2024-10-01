resource "azurerm_network_interface" "web-app-interface1" {
    name = var.interfacename
    location = var.location
    resource_group_name = var.rsg-name
    ip_configuration {
      name = "internal"
      subnet_id = var.subnetid
      private_ip_address_allocation =  "Dynamic"
    }
  
}
resource "azurerm_linux_virtual_machine" "vm" {
    name = var.vmname
    resource_group_name = var.rsg-name
    location = var.location
    size = var.vmsize
    admin_username = var.username
    admin_password = var.userpassword
    disable_password_authentication = false
    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"

    }
    source_image_reference {
      publisher = "Canonical"
      offer = "0001-com-ubuntu-server-jammy"
      sku = "22_04-lts"
      version = "latest"
    }
    network_interface_ids = [azurerm_network_interface.web-app-interface1.id]
     

  
}