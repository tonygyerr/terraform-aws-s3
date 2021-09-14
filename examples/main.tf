module "s3_reporting" {
  source        = "git::ssh://git@github.com:tonygyerr/terraform-aws-s3.git"
  bucket_name   = "digital-reporting-system-dev"
  # bucket_policy = "policy/s3_bucket_reporting_policy.json"
  bucket_policy = templatefile("${path.module}/${var.bucket_policy}", {
    s3_key_users         = jsonencode(var.s3_key_users),
    s3_bucket_resources  = jsonencode(var.s3_bucket_resources)
  }) 
  s3_key_users  = var.s3_key_users
  s3_bucket_resources = var.s3_bucket_resources
  sse_algorithm = "AES256"
  aws_region    = "us-east-1"
  tags          = {
    Owner       = "cv-service"
    Environment = "dev"
    Name        = "cv-service-s3-iac"
    Region      = "us-east-1"
    CostCenter  = "cv-service"
  }
}