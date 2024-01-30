# module 1 => vpc
module "pfs_vpc" {
  source   = "./modules/vpc"
  cidr_block = var.cidr_block
  instance_tenancy = var.instance_tenancy
  tags_vpc = var.tags_vpc
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
}
#############  module 2 => internet gateway #####################

module "igw" {
  source   = "./modules/internet_gateway"
  vpc_id   = module.pfs_vpc.pfs_vpc_id
  tags_igw = var.tags_igw
}

# module 3 => elastic ip

module "eip" {
  source   = "./modules/elastic_ip"
  tags_eip = var.tags_eip
  igw      = module.igw
}
# module 4 => Nat gateway

module "nat" {
   source        = "./modules/nat_gateway"
   eip_id        = module.eip.eip_id
   tags_nat      = var.tags_nat
   nat_subnet_id = module.subnet-pub-1a.subnet_id
 }
# module 5 => public_rt

module "public_rt" {
  source        = "./modules/route_tables"
  rt_tags       = var.rt_tags_pub
  rt_cidr_block = var.rt_cidr_block_pub
  gateway_id    = module.igw.pfs_igw_id
  vpc_id        = module.pfs_vpc.pfs_vpc_id
}

# module 5 => private_rt

module "private_rt" {
  source        = "./modules/route_tables"
  rt_tags       = var.rt_tags_priv
  rt_cidr_block = var.rt_cidr_block_priv
  gateway_id    = module.nat.nat_id
  vpc_id        = module.pfs_vpc.pfs_vpc_id
}

