module "kms" {

  source         = "../../modules/kms"
  kms_statements = var.kms_statements
  tags           = var.tags

}

module "s3_bucket" {

  source            = "../../modules/s3"
  s3_bucket_name    = var.s3_bucket_name
  tags              = var.tags
  kms_master_key_id = module.kms.kms_master_key_id

}

module "aurora-postgresql" {

  source                = "../../modules/rds"
  db_master_username    = var.db_master_username
  instance_class        = var.instance_class
  kms_master_key_id     = module.kms.kms_master_key_id
  database_name         = var.database_name
  db_cluster_identifier = var.db_cluster_identifier
  instances_count       = var.instances_count

  tags = var.tags

}

# module "secret_pgadmin" {
#   source = "../../modules/secret_manager"
#   db_master_password = var.db_master_password
#   db_master_username = var.db_master_username
# }

