output "secretsmanager_arn" {
  description = "ARN del secreto pgadmin"
  value       = aws_secretsmanager_secret.pgadmin.arn
}