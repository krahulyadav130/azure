# module "pip-create" {
#     source = "./ProjectA/networking/pip"
#     location = module.project-a-rsg.rsglocation
#     rsgname = module.project-a-rsg.rsgname
#     pipname = "project-agw-pip"
  
# }

# # module "project-a-agw" {
# #     source = "./ProjectA/networking/gw"
# #     priority_1 = 200
# #     agwipname = "agw-ip"
# #     fronted_port_name = "http"
# #     request_route_rule_name = "http-route"
# #     app-gw-name = "project-agw-dev"
# #     fronted_ip_conf_name = "project-agw-dev-pip"
# #     timeout = 60
# #     http_setting_name = "http-setting-webapp"
# #     listener_name = "http-listener-80"
# #     subnetid = module.websubnet.subnetids
# #     protocal = "Http"
# #     rsg-name = module.project-a-rsg.rsgname
# #     backend_port = 80
# #     frontend_port_name = "http"
# #     location = module.project-a-rsg.rsglocation
# #     backend_address_pool_name = "web-server-backendpool1"
# #     fronted_public_ip = module.pip-create.pip_details.id



 
# # }

# #Manual create test

# resource "azurerm_application_gateway" "network" {
#   name                = "project-a-agw"
#   resource_group_name = module.project-a-rsg.rsgname
#   location            = module.project-a-rsg.rsglocation

#   sku {
#     name     = "Standard_v2"
#     tier     = "Standard_v2"
#     capacity = 2
#   }

#   gateway_ip_configuration {
#     name      = "my-gateway-ip-configuration"
#     subnet_id = module.nnnn.subnet-ids
#   }

#   frontend_port {
#     name = "frontend_port_name"
#     port = 80
#   }

#   frontend_ip_configuration {
#     name                 = "frontend_ip_configuration_name"
#     public_ip_address_id = module.pip-create.pip_details.id
#   }

#   backend_address_pool {
#     name = "backend_address_pool_name"
#   }

#   backend_http_settings {
#     name                  = "http_setting_name"
#     cookie_based_affinity = "Disabled"
#     path                  = "/path1/"
#     port                  = 80
#     protocol              = "Http"
#     request_timeout       = 60
#   }

#   http_listener {
#     name                           = "listener_name"
#     frontend_ip_configuration_name = "frontend_ip_configuration_name"
#     frontend_port_name             = "frontend_port_name"
#     protocol                       = "Http"
#   }

#   request_routing_rule {
#     name                       = "request_routing_rule_name"
#     priority                   = 200
#     rule_type                  = "Basic"
#     http_listener_name         = "listener_name"
#     backend_address_pool_name  = "backend_address_pool_name"
#     backend_http_settings_name = "http_setting_name"
#   }
# }

# resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "name" {
#     network_interface_id = module.project-a-vm.webapp-nic-id
#     ip_configuration_name = "internal"
#     backend_address_pool_id = tolist(azurerm_application_gateway.network.backend_address_pool).0.id

# }  
 

