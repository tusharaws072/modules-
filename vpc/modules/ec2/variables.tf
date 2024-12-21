variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will be deployed"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to attach the security group"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "ec2-security-group"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default     = {}
}