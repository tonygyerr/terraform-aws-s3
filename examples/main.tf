module "s3_reporting" {
  source        = "git::ssh://git@github.com:tonygyerr/terraform-aws-s3.git"
  bucket_name   = "digital-reporting-system-dev"
  bucket_policy = "policy/s3_bucket_reporting_policy.json"
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