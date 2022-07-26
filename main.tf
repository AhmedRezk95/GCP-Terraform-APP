module "network" {
    source = "./network"
    # i made default values inside every variable, it will be considered if i didn't set any values here
}

module "serviceaccount" {
    source = "./serviceaccount"
}

module "gke" {
    source = "./gke"
    # variables from variable.tf in gke module = module linked to output.tf in network module
    vpc_name = module.network.vpc_name
    restricted_subnet_name = module.network.restricted_subnet_name
    cluster_secondary_range_name = module.network.cluster_secondary_range_name
    service_secondary_range_name = module.network.service_secondary_range_name
    management_subnet_cidr = module.network.management_subnet_cidr
    # for node pool
    serviceaccount_email = module.serviceaccount.serviceaccount_email
}
