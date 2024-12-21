
####################################### VPC ############################

module "vpc" {
  source                     = "./modules/vpc"
  region                     = var.region
  project_name               = var.project_name
  vpc_cidr                   = var.vpc_cidr
  nat_destination_cidr_block = var.nat_destination_cidr_block
  stage_name                 = var.stage_name
  availability_zones         = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  nat_eip_allocation_id      = aws_eip.nat.id
}
resource "aws_eip" "nat" {
  vpc = true
}


###################################    EC2     ###################


module "ec2" {
  source              = "./modules/ec2"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  subnet_id           = module.vpc.public_subnets[0]
  vpc_id              = module.vpc.vpc_id
  security_group_name = "root-ec2-sg"
  tags = {
    Name = "EC2-instance"
    Env  = var.environment
  }
}

# ########################################### S3  ########################


# module "s3_bucket_admin" {
#   source = "./modules/s3"

#   bucket_name = var.admin_bucket_name
#   region      = var.region
# }

# ########################################## CDN ##############################

# module "cdn_admin" {
#   source = "./modules/cdn"

#   s3_bucket_domain_name = module.s3_bucket_admin.bucket_domain_name
#   s3_bucket_arn         = module.s3_bucket_admin.bucket_arn
#   cloudfront_comment    = var.cloudfront_Admin_comment

#   depends_on = [module.s3_bucket_admin]
# }


########################################## SNS ########################3

module "sns" {
  source        = "./modules/sns"
  db_identifier = var.db_identifier
  sns_email     = var.sns_email
}

####################################### MYSQL ###########################3
module "mysql" {
  source = "./modules/mysql"

}
##################################### CLOUDWATCH #######################
module "cloudwatch" {
  source     = "./modules/cloudwatch"
  depends_on = [module.mysql]
}


########################           ALB #############################
module "alb" {
  source                     = "./modules/alb"
  vpc_id                     = module.vpc.vpc_id
  subnets                    = module.vpc.public_subnets
  name_prefix                = "my-app"
  target_port                = 80
  listener_port              = 80
  health_check_path          = "/health"
  health_check_interval      = 30
  health_check_timeout       = 5
  healthy_threshold          = 2
  unhealthy_threshold        = 2
  enable_deletion_protection = false
}
