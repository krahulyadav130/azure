
#Azure AGW-deployment
resource "azurerm_application_gateway" "project-a-gateway" {
    name = var.app-gw-name
    resource_group_name = var.rsg-name
    location = var.location
    sku {
      name = "Standard_v2"
      tier = "Standard_v2"
      capacity = 1

    }
    gateway_ip_configuration {
      name = var.agwipname
      subnet_id = var.subnetid

    }
    frontend_port {
      name = var.fronted_port_name
      port = 80
      
    }
    frontend_ip_configuration {
      name = var.fronted_ip_conf_name
      public_ip_address_id = var.fronted_public_ip
    }
    backend_address_pool {
      name = var.backend_address_pool_name

    }
    backend_http_settings {
      name = var.http_setting_name
      cookie_based_affinity = "Disabled"
      path = "/"
      port = var.backend_port
      protocol = var.protocal
      request_timeout = var.timeout

    }
    http_listener {
      name = var.listener_name
      frontend_ip_configuration_name = var.fronted_public_ip
      frontend_port_name = var.frontend_port_name
      protocol = "Http"
    }
    request_routing_rule {
      name = var.request_route_rule_name
      priority = var.priority_1
      rule_type = "Basic"
      http_listener_name = var.listener_name
      backend_address_pool_name = var.backend_address_pool_name
      backend_http_settings_name = var.http_setting_name
    }
    
  
}