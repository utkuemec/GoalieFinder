variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ca-central-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "goaliefinder"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "production"
}

variable "db_password" {
  description = "PostgreSQL master password"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "jwt_secret" {
  description = "JWT signing secret (64+ chars)"
  type        = string
  sensitive   = true
}

variable "stripe_secret_key" {
  description = "Stripe secret key"
  type        = string
  sensitive   = true
}

variable "stripe_publishable_key" {
  description = "Stripe publishable key"
  type        = string
  sensitive   = true
}

variable "smtp_host" {
  description = "SMTP server hostname"
  type        = string
  default     = "smtp.gmail.com"
}

variable "smtp_port" {
  description = "SMTP server port"
  type        = string
  default     = "587"
}

variable "smtp_user" {
  description = "SMTP username/email"
  type        = string
  sensitive   = true
}

variable "smtp_password" {
  description = "SMTP app password"
  type        = string
  sensitive   = true
}

variable "frontend_base_url" {
  description = "Frontend base URL for email links"
  type        = string
  default     = "https://www.goaliefinders.com"
}

variable "domain_name" {
  description = "Domain name for the application (leave empty to skip DNS setup)"
  type        = string
  default     = ""
}

variable "api_container_port" {
  description = "Port the API container listens on"
  type        = number
  default     = 5000
}

variable "api_cpu" {
  description = "Fargate task CPU units (256 = 0.25 vCPU)"
  type        = number
  default     = 512
}

variable "api_memory" {
  description = "Fargate task memory in MB"
  type        = number
  default     = 1024
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
  default     = 1
}
