output "rds_cluster_endpoint" {
  description = "Endpoint del cluster Aurora"
  value       = aws_rds_cluster.postgresql.endpoint
}

output "rds_secret_arn" {
  description = "ARN del Secreto creado para guardar la Master Password"
  value       = aws_rds_cluster.postgresql.master_user_secret
}