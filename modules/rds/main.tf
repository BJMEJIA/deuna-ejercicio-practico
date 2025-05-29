# RDS Aurora cluster
resource "aws_rds_cluster" "postgresql" {
  cluster_identifier            = var.db_cluster_identifier
  engine                        = "aurora-postgresql"
  database_name                 = var.database_name
  master_user_secret_kms_key_id = var.kms_master_key_id
  master_username               = var.db_master_username
  manage_master_user_password   = true
  skip_final_snapshot           = true

  tags = var.tags
}

# Instancias del cluster de RDS Aurora
resource "aws_rds_cluster_instance" "cluster_instance" {
  count              = var.instances_count
  identifier         = "${var.db_cluster_identifier}-instance-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.postgresql.id
  instance_class     = var.instance_class
  engine             = aws_rds_cluster.postgresql.engine
  engine_version     = aws_rds_cluster.postgresql.engine_version

  tags = var.tags
}