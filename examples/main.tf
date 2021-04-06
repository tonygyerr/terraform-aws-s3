module "s3_remote_state" {
  source        = "git::ssh://git@github.com:tonygyerr/terraform-aws-s3.git"
  # source = "../"
  bucket_name   = "digital-reporting-state-dev-bucket"
  bucket_policy = templatefile("${path.module}/${var.s3_bucket_backend_policy_path}", {
    s3_key_users         = jsonencode(var.s3_key_users),
    s3_bucket_resources  = jsonencode(var.s3_bucket_resources)
  })
  sse_algorithm = var.sse_algorithm
  aws_region    = var.aws_region
  tags          = var.tags
}

module "s3_reporting" {
  source        = "git::ssh://git@github.com:tonygyerr/terraform-aws-s3.git"
  # source = "../"
  bucket_name   = "digital-reporting-system-dev"
  bucket_policy = templatefile("${path.module}/${var.s3_bucket_backend_policy_path}", {
    s3_key_users         = jsonencode(var.s3_key_users),
    s3_bucket_resources  = jsonencode(var.s3_bucket_resources)
  })
  sse_algorithm = var.sse_algorithm
  aws_region    = var.aws_region
  tags          = var.tags
}