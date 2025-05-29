resource "aws_secretsmanager_secret" "pgadmin" {
  name        = "deuna-pgadmin-credentials"
  description = "Credenciales de pgadmin para Aurora"
  kms_key_id  = var.kms_master_key_id

  tags = {
    Environment = "production"
  }
}

resource "aws_secretsmanager_secret_version" "pgadmin_version" {
  secret_id = aws_secretsmanager_secret.pgadmin.id
  secret_string = jsonencode({
    username = var.db_master_username
    password = var.db_master_password
  })
}