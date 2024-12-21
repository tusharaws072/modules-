

output "vpc_id" {
  value = module.vpc.vpc_id
}



# output "admin_s3_bucket" {
#   description = "Admin S3 bucket"
#   value       = module.s3_bucket_admin.bucket_id
# }

# output "admin_cdn_id" {
#   description = "Admin CDN ID"
#   value       = module.cdn_admin.cloudfront_distribution_id
# }



output "sns_topic_arn" {
  value       = module.sns.sns_topic_arn
  description = "The ARN of the SNS topic for alarms"
}

################################## alb #######
//output "public_subnets" {
 // value = aws_subnet.public.*.id
//}
