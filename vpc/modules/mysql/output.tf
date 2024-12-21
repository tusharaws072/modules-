output "rds_endpoint" {
  description = "The endpoint of the RDS instance."
  value       = module.rds.db_instance_endpoint
}

output "rds_arn" {
  description = "The ARN of the RDS instance."
  value       = module.rds.db_instance_arn
}

output "rds_instance_id" {
  description = "The RDS instance ID."
  value       = module.rds.db_instance_id
}


############################################3






