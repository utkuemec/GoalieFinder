# Store application secrets in AWS Secrets Manager
resource "aws_secretsmanager_secret" "app_secrets" {
  name                    = "${var.project_name}/app-secrets"
  recovery_window_in_days = 7
  tags                    = { Name = "${var.project_name}-secrets" }
}

resource "aws_secretsmanager_secret_version" "app_secrets" {
  secret_id = aws_secretsmanager_secret.app_secrets.id

  secret_string = jsonencode({
    ConnectionStrings__DefaultConnection = "Host=${aws_db_instance.main.address};Port=5432;Database=goaliefinder;Username=postgres;Password=${var.db_password}"
    Jwt__Secret                          = var.jwt_secret
    Jwt__Issuer                          = "GoalieFinder"
    Jwt__Audience                        = "GoalieFinder"
  })
}
