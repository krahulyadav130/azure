module "project-a-rsg" {
    source = "./ProjectA/resourcegroup"
    rsg-name = "rahul-projectb"
    location = "CentralIndia"

  
}

module "projecta-vnet" {
    source = "./ProjectA/networking"
    rsg-name = module.project-a-rsg.rsgname
    vnetname = "projecta-vnet"
    location = module.project-a-rsg.rsglocation
    vnet-ip = ["172.16.0.0/24"]

}
