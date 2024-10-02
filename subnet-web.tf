module "project-a-webapp-subnet" {
  source = "./ProjectA/networking/subnet"
  rsg-name = module.project-a-rsg.rsgname
  subnetaddress = ["172.16.10.0/24"]
  vnetname = module.projecta-vnet.vnetname
  subnetname = "Web-subnet"
}

module "project-a-db-subnet" {
    source = "./ProjectA/networking/subnet"
    rsg-name = module.project-a-rsg.rsgname
    vnetname = module.projecta-vnet.vnetname
    subnetaddress = ["172.16.5.0/24"]
    subnetname = "db-subnet"
  
}
module "nnnn" {
    source = "./ProjectA/networking/subnet"
    rsg-name = module.project-a-rsg.rsgname
    vnetname = module.projecta-vnet.vnetname
    subnetaddress = ["172.16.4.0/24"]
    subnetname = "gw-subnet"
  
}