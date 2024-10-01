module "project-a-vm" {
    source = "./ProjectA/compute"
    rsg-name = module.project-a-rsg.rsgname
    location = module.project-a-rsg.rsglocation
    subnetid = module.websubnet.subnetids
    interfacename = "project-a-webapp-nic1"
    vmname = "rahul-webapp-vm"
    vmsize = "Standard_B1s"
    username = "rahuladmin"
    userpassword = "Qwertyuiop@123"


  
}
