resource "aws_s3_bucket" "this" {
  bucket        = var.bucket_name
  # policy        = templatefile("${path.module}/policy/s3_prv_bucket_backend_policy.tmpl", {
  #   s3_key_users         = jsonencode(var.s3_key_users),
  #   s3_bucket_resources  = jsonencode(var.s3_bucket_resources)
  # })
  policy        = var.s3_bucket_backend_policy_path
  # policy        = file("${path.module}/policy/s3_prv_bucket_policy.json")
  acl           = "private"

  lifecycle_rule {
    id            = "log"
    enabled       = var.lifecycle_rule_enabled

    prefix        = "log/"
    tags          = merge(var.tags, map("Name", format("%s", var.bucket_name)))

    noncurrent_version_expiration {
      days          = var.noncurrent_version_expiration_days
    }
  
    noncurrent_version_transition {
      days          = var.noncurrent_version_transition_days
      storage_class = "GLACIER"
    }

    transition {
      days          = var.standard_transition_days
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.glacier_transition_days
      storage_class = "GLACIER"
    }

    expiration {
      days = var.expiration_days
    }
  }
  lifecycle_rule {
    id            = "endpoint"
    enabled       = var.lifecycle_rule_enabled

    prefix        = "endpoint/"
    tags          = merge(var.tags, map("Name", format("%s", var.bucket_name)))

    noncurrent_version_expiration {
      days          = var.noncurrent_version_expiration_days
    }
  
    noncurrent_version_transition {
      days          = var.noncurrent_version_transition_days
      storage_class = "GLACIER"
    }

    transition {
      days          = var.standard_transition_days
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.glacier_transition_days
      storage_class = "GLACIER"
    }

    expiration {
      days = var.expiration_days
    }
  }
  lifecycle_rule {
    id            = "model"
    enabled       = var.lifecycle_rule_enabled

    prefix        = "model/"
    tags          = merge(var.tags, map("Name", format("%s", var.bucket_name)))

    noncurrent_version_expiration {
      days          = var.noncurrent_version_expiration_days
    }
  
    noncurrent_version_transition {
      days          = var.noncurrent_version_transition_days
      storage_class = "GLACIER"
    }

    transition {
      days          = var.standard_transition_days
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.glacier_transition_days
      storage_class = "GLACIER"
    }

    expiration {
      days = var.expiration_days
    }
  }
  lifecycle_rule {
    id            = "notebook"
    enabled       = var.lifecycle_rule_enabled

    prefix        = "notebook/"
    tags          = merge(var.tags, map("Name", format("%s", var.bucket_name)))

    noncurrent_version_expiration {
      days          = var.noncurrent_version_expiration_days
    }
  
    noncurrent_version_transition {
      days          = var.noncurrent_version_transition_days
      storage_class = "GLACIER"
    }

    transition {
      days          = var.standard_transition_days
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = var.glacier_transition_days
      storage_class = "GLACIER"
    }

    expiration {
      days = var.expiration_days
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }

  force_destroy = true
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  # policy        = templatefile("${path.module}/policy/sagemaker-s3-bucket-policy.tmpl", {
  #   s3_key_users         = jsonencode(var.s3_key_users),
  #   s3_bucket_resources  = jsonencode(var.s3_bucket_resources)
  # })
  policy          = var.s3_bucket_backend_policy_path
}

# resource "aws_s3_bucket_policy" "iot" {
#   bucket = aws_s3_bucket.this.id
#   policy = file("${path.module}/policy/iot-bucket-policy.json")
# }

# make the bucket have private access
resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}