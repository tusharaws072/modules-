

variable "rds_identifier" {
  description = "The unique identifier for the RDS instance."
  type        = string
  default     = "demodb"
}

variable "rds_engine" {
  description = "The database engine for the RDS instance."
  type        = string
  default     = "mysql"
}

variable "rds_major_engine_version" {
  description = "The major version of the database engine."
  type        = string
  default     = "8.0"
}

variable "rds_instance_class" {
  description = "The instance class of the RDS instance."
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "The allocated storage in GB for the RDS instance."
  type        = number
  default     = 20
}

variable "rds_db_name" {
  description = "The name of the database to create."
  type        = string
  default     = "mydatabase"
}

variable "rds_username" {
  description = "The username for the RDS instance."
  type        = string
  default     = "tushar"
}

variable "rds_password" {
  description = "The password for the RDS instance."
  type        = string
  sensitive   = true
  default     = "password"
}


variable "rds_publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible."
  type        = bool
  default     = false
}

variable "rds_skip_final_snapshot" {
  description = "Whether to skip the final snapshot when the RDS instance is deleted."
  type        = bool
  default     = true
}
