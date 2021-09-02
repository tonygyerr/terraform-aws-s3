module "s3_remote_state" {
  source        = "git::ssh://git@github.com:tonygyerr/terraform-aws-s3.git"
  bucket_name   = "digital-reporting-state-dev-bucket"
  bucket_policy = "policy/s3_bucket_reporting_policy.json"
  sse_algorithm = var.sse_algorithm
  aws_region    = var.aws_region
  tags          = var.tags
}

module "s3_reporting" {
  source        = "git::ssh://git@github.com:tonygyerr/terraform-aws-s3.git"
  bucket_name   = "digital-reporting-system-dev"
  bucket_policy = "policy/s3_bucket_reporting_policy.json"
  sse_algorithm = var.sse_algorithm
  aws_region    = var.aws_region
  tags          = var.tags
}