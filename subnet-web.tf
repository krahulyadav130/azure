module "websubnet" {
  source = "./ProjectA/networking/subnet"
  rsg-name = module.project-a-rsg.rsgname
  subnetaddress = ["172.16.10.0/24"]
  vnetname = module.projecta-vnet.vnetname
  subnetname = "Web-subnet"
}