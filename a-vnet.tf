module "project-a-rsg" {
    source = "./ProjectA/resourcegroup"
    rsg-name = "rahul-projectb"
    location = "CentralIndia"

  
}

module "projecta-vnet" {
    source = "./ProjectA/networking/vnet"
    rsg-name = module.project-a-rsg.rsgname
    vnetname = "projecta-vnet"
    location = module.project-a-rsg.rsglocation
    vnet-ip = ["172.16.0.0/16"]
    subnetaddress = ["172.16.1.0/24"]
    subnetname = "webapp-subnet1"

}

module "project-a-subnet" {
    source = "./ProjectA/networking/subnet"
    rsg-name = module.project-a-rsg.rsgname
    vnetname = module.projecta-vnet.vnetname
    subnetaddress = ["172.16.1.0/24"]
    subnetname = "db-subnet"
  
}

