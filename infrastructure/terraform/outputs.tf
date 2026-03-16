output "ecr_repository_url" {
  description = "ECR repository URL for API Docker images"
  value       = aws_ecr_repository.api.repository_url
}

output "alb_dns_name" {
  description = "ALB DNS name (use this as your API URL until domain is set up)"
  value       = aws_lb.api.dns_name
}

output "rds_endpoint" {
  description = "RDS PostgreSQL endpoint"
  value       = aws_db_instance.main.address
}

output "redis_endpoint" {
  description = "ElastiCache Redis endpoint"
  value       = aws_elasticache_cluster.main.cache_nodes[0].address
}

output "s3_bucket_name" {
  description = "S3 bucket name for uploads"
  value       = aws_s3_bucket.uploads.bucket
}

output "deploy_access_key_id" {
  description = "CI/CD deploy user access key ID"
  value       = aws_iam_access_key.deploy.id
  sensitive   = true
}

output "deploy_secret_access_key" {
  description = "CI/CD deploy user secret access key"
  value       = aws_iam_access_key.deploy.secret
  sensitive   = true
}

output "connection_string" {
  description = "PostgreSQL connection string for the API"
  value       = "Host=${aws_db_instance.main.address};Port=5432;Database=goaliefinder;Username=postgres;Password=<YOUR_DB_PASSWORD>"
  sensitive   = false
}

output "api_url" {
  description = "API base URL"
  value       = "http://${aws_lb.api.dns_name}/api"
}
