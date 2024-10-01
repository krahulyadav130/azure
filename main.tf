module "rsg-module" {
    source = "./ProjectA/compute"
    rsg-location = "CentralIndia"
    rsg-name = "ProjectA-test"
}

resource "azurerm_resource_group" "rsgname" {
    name = "test-rsg"
    location = "CentralIndia"
  
}


