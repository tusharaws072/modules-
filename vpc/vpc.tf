###################################   PROVIDER ####################
variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1" # Singapore region
}

variable "access_key" {
  description = "AWS access key for authentication."
  type        = string
  sensitive   = true
  default     = ""
}

variable "secret_key" {
  description = "AWS secret key for authentication."
  type        = string
  sensitive   = true
  default     = ""
}



################################################   VPC #############

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "aws-project"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "nat_destination_cidr_block" {
  description = "CIDR block for NAT destination routing"
  type        = string
  default     = "0.0.0.0/0"
}

variable "stage_name" {
  description = "Deployment stage (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "nat_eip_allocation_id" {
  description = "Elastic IP allocation ID for the NAT Gateway"
  type        = string
  default     = "eipalloc-1234567890abcdef" # Replace with a valid EIP allocation ID
}



############################################### EC2 #####################

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-06650ca7ed78ff6fa"
}


variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "environment" {
  description = "Environment for the resources"
  type        = string
  default     = "dev"
}


########################################3 S3 ############
variable "admin_bucket_name" {
  description = "S3 bucket for admin"
  type        = string
  default     = "joyjam-admin-bucket"
}

variable "cloudfront_Admin_comment" {
  description = "Comment for the CloudFront distribution"
  type        = string
  default     = "CloudFront Admin"
}



###################### RDS #####################
variable "db_identifier" {
  description = "The database identifier for naming resources"
  type        = string
  default     = "rds"
}


variable "sns_email" {
  default = "testing@gmail.com"
}

variable "database_type" {
  description = "Specify the type of database (mysql or postgres)"
  type        = string
  default     = "mysql"
}
