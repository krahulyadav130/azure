resource "azurerm_recovery_services_vault" "rsv" {
    name = "rsv-name"    
    location = module.project-a-rsg.rsglocation  
    sku = "Standard"
    resource_group_name = module.project-a-rsg.rsgname                                                                                                                                      
}    

resource "azurerm_backup_policy_vm" "rsv-backup-policy" {
    name = "rsv-policy-name"
    resource_group_name = module.project-a-rsg.rsgname 
    recovery_vault_name = azurerm_recovery_services_vault.rsv.name
    backup {
      frequency = "Daily"
      time = "14:00"

    }
    retention_daily {
      count = 10
    }
    
}
data "azurerm_virtual_machine" "vm-backup" {
    name = "rahul-webapp-vm"
    resource_group_name = "RAHUL-PROJECTB"
  
}

resource "azurerm_backup_protected_vm" "backup-enable" {
    resource_group_name = module.project-a-rsg.rsgname
    recovery_vault_name = azurerm_recovery_services_vault.rsv.name
    source_vm_id = data.azurerm_virtual_machine.vm-backup.id
    backup_policy_id = azurerm_backup_policy_vm.rsv-backup-policy.id


  
}
data "azurerm_managed_disk" "vm-disk" {
    resource_group_name = "RAHUL-PROJECTB"
    name = "rahul-webapp-vm_disk1_338be400ef3141c7825ddf272d9e066c"

  
}
resource "azurerm_snapshot" "snapshot-name" {
    name = "snapshot-rahul-webapp-vm"
    resource_group_name =  "RAHUL-PROJECTB"
    create_option = "Copy"
    source_uri = data.azurerm_managed_disk.vm-disk.id
    location = "CentralIndia"
  
}

