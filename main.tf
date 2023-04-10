module "vpc" {
  source = "git::https://github.com/KavyaNaveena/tf-module-vpc.git"
  env = var.env
  tags = var.tags
  default_vpc_id = var.default_vpc_id
  default_route_table = var.default_route_table

  for_each = var.vpc
  vpc_cidr = each.value["vpc_cidr"]
  public_subnets = each.value["public_subnets"]
  private_subnets = each.value["private_subnets"]
}

 module "docdb" {
  source = "git::https://github.com/KavyaNaveena/tf-module-docdb.git"
  env    = var.env
  tags   = var.tags

   for_each                 = var.docdb
   engine                  = each.value["engine"]
   backup_retention_period = each.value["backup_retention_period"]
   preferred_backup_window = each.value["preferred_backup_window"]
   skip_final_snapshot     = each.value["skip_final_snapshot"]
   engine_version          = each.value["engine_version"]
   subnet_ids              = local.db_subnet_ids
   no_of_instances         = each.value["no_of_instances"]
   instance_class          = each.value["instance_class"]
}

#output "vpc" {
#  value = local.db_subnet_ids
#}

module "rds" {
  source = "git::https://github.com/KavyaNaveena/tf-module-rds.git"
  env    = var.env
  tags   = var.tags

  subnet_ids              = local.db_subnet_ids

  for_each                 = var.rds
  engine                  = each.value["engine"]
  engine_version          = each.value["engine_version"]
  backup_retention_period = each.value["backup_retention_period"]
  preferred_backup_window = each.value["preferred_backup_window"]
}