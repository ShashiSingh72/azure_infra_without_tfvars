module "resource_group" {
    source = "../../modules/resource_group"
    rgs = var.rgs
}

module "storage_account" {
    depends_on = [module.resource_group]
    source = "../../modules/storage_account"
    stgs = var.stgs
}

module "networking" {
    depends_on = [module.resource_group,]
    source = "../../modules/networking"
    vnets = var.vnets
}

module "compute" {
    depends_on = [module.resource_group, module.networking]
    source = "../../modules/compute"
    vms = var.vms
}
