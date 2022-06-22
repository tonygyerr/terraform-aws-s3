locals {
  template_dir       = "${path.module}/policy/s3-policy/s3_policy.tmpl"
  template_vars      = {
    s3_key_users        = jsonencode(var.s3_key_users)
    s3_bucket_resources = jsonencode(var.s3_bucket_resources)
  }
  policy             = templatefile("${local.template_dir}", local.template_vars)
}
