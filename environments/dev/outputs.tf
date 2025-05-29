output "kms_key_arn" {
  description = "ARN de la llave KMS"
  value       = module.kms.kms_key_arn
}

output "s3_bucket_name" {
  description = "Nombre del bucket S3 creado"
  value       = module.s3_bucket.s3_bucket_name
}

output "rds_cluster_endpoint" {
  description = "Endpoint del cluster Aurora"
  value       = module.aurora-postgresql.rds_cluster_endpoint
}

output "rds_secret_arn" {
  description = "ARN del Secreto creado para guardar la Master Password"
  value       = module.aurora-postgresql.rds_secret_arn
}

# output "secretsmanager_arn" {
#   description = "ARN del secreto pgadmin"
#   value       = aws_secretsmanager_secret.pgadmin.arn
# }