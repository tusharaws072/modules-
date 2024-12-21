resource "aws_iam_role" "rds_monitoring" {
  name = "${var.rds_identifier}-monitoring-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "monitoring.rds.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "rds_monitoring_policy" {
  role       = aws_iam_role.rds_monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"

}



module "rds" {
  source     = "terraform-aws-modules/rds/aws"
  identifier = var.rds_identifier
  version    = "~> 5.0"

  engine                  = var.rds_engine
  major_engine_version    = var.rds_major_engine_version
  instance_class          = var.rds_instance_class
  allocated_storage       = var.rds_allocated_storage
  db_name                 = var.rds_db_name
  username                = var.rds_username
  password                = var.rds_password
  backup_retention_period = 7

  publicly_accessible = var.rds_publicly_accessible
  skip_final_snapshot = var.rds_skip_final_snapshot
  family              = "mysql8.0"

  monitoring_role_arn = aws_iam_role.rds_monitoring.arn # Link the IAM role to the RDS module

  tags = {
    Name = "my-mysql-db"
  }
}
