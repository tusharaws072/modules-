variable "vpc_id" {
  description = "The VPC ID where the ALB will be deployed."
  type        = string
}

variable "subnets" {
  description = "Subnets for the ALB."
  type        = list(string)
}

variable "name_prefix" {
  description = "A prefix for naming resources."
  type        = string
}

variable "target_port" {
  description = "The port the target group listens on."
  type        = number
  default     = 80
}

variable "target_type" {
  description = "The target type for the target group (e.g., instance, ip)."
  type        = string
  default     = "instance"
}

variable "listener_port" {
  description = "The listener port for the ALB."
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "Path for health check requests."
  type        = string
  default     = "/"
}

variable "health_check_interval" {
  description = "Interval between health checks."
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Timeout for health check responses."
  type        = number
  default     = 5
}

variable "healthy_threshold" {
  description = "Number of successful responses before marking a target as healthy."
  type        = number
  default     = 2
}

variable "unhealthy_threshold" {
  description = "Number of failed responses before marking a target as unhealthy."
  type        = number
  default     = 2
}

variable "enable_deletion_protection" {
  description = "Enable deletion protection for the ALB."
  type        = bool
  default     = false
}
