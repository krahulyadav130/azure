# resource "azurerm_recovery_services_vault" "rsv" {
#     name = var.rsv-name    
#     location = var.location
#     sku = var.skus
#     resource_group_name = var.rsg-name                                                                                                                                        
# }    

# resource "azurerm_backup_policy_vm" "rsv-backup-policy" {
#     name = var.rsv-policy-name
#     resource_group_name = var.rsg-name
#     recovery_vault_name = var.rsv-name
#     backup {
#       frequency = "Daily"
#       time = "14:00"

#     }
#     retention_daily {
#       count = 10
#     }
    
# }
# data "" "name" {
  
# }
