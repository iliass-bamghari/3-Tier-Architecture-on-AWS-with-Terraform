################################## subnet-rds-priv-1a #################################################

module "subnet-rds-priv-1a" {
  source      = "./modules/subnet"
  vpc_id        = module.pfs_vpc.pfs_vpc_id
  cidr_subnet = "10.0.5.0/24"
  az_subnet   = "eu-north-1a"
  public      = false

  tags_subnet = {
  Name = "pfs-priv-rds-eu-north-1a",
  Kind = "test"
}
}
################################## subnet-rds-priv-1b #################################################

module "subnet-rds-priv-1b" {
  source      = "./modules/subnet"
  vpc_id        = module.pfs_vpc.pfs_vpc_id
  cidr_subnet = "10.0.6.0/24"
  az_subnet   = "eu-north-1b"
  public      = false

  tags_subnet = {
  Name = "pfs-priv-rds-eu-north-1b",
  Kind = "test"
}
}

################################## rt association 1a #################################################

module "rt_ass_rds_priv_1a" {
  source         = "./modules/rt_association"
  subnet_id      = module.subnet-rds-priv-1a.subnet_id
  route_table_id = module.private_rt.rt_id
}

################################## rt association 1b #################################################

module "rt_ass_rds_priv_1b" {
  source         = "./modules/rt_association"
  subnet_id      = module.subnet-rds-priv-1b.subnet_id
  route_table_id = module.private_rt.rt_id
}
################################## security group for rds #################################################

module "sg_rds" {
  source = "./modules/security_group"

  ingress_rules = [
    {
      description     = "allow on 3306"
      from_port       = 3306
      to_port         = 3306
      protocol        = "tcp"
      cidr_blocks     = null
      security_groups = [module.sg_app_server.sg_id]
    }

  ]
  vpc_id        = module.pfs_vpc.pfs_vpc_id
  sg_name        = "pfs_sg_rds"
  sg_description = "SG for rds"
  egress_rules = [
    {
      description     = "allow"
      from_port       = 3306
      to_port         = 3306
      protocol        = "tcp"
      cidr_blocks     = null
      security_groups = [module.sg_app_server.sg_id]
    }
  ]
  #security_groups = var.security_groups_app_server
  tags_sg = {
    Name = "tf-db-sg",
    Kind = "practice"
  }
}
##################################  #################################################

module db_subnet_group {
  source = "./modules/subnet_group"
  subnet_ids_subnet_group = [module.subnet-rds-priv-1a.subnet_id,module.subnet-rds-priv-1b.subnet_id]
  subnet_group_name = "pfs-main"

  tags_subnet_group = {
  Name = "pfs DB subnet group"
  Kind = "test"
   }
}

################################## rds #################################################

module "db" {
  source            = "./modules/rds"
  identifier_name = "pfs-db"
  allocated_storage = 10
  db_name           = "test"
  username = "iliass"
  vpc_security_group_ids = [module.sg_rds.sg_id]

  tags_rds = {
    Name = "pfs-db",
    Kind = "test"
  }
  subnet_group_name = module.db_subnet_group.subnet_group_id #"${aws_db_subnet_group.subnet_group.name}"
}

# retreve password => terraform state show module.db.aws_db_instance.db
# output for retreving password :
# output "db_password" {
#   value     = aws_db_instance.db.password
#   sensitive = true  # Mark as sensitive to avoid displaying in plain text
# }

