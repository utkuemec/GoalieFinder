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
