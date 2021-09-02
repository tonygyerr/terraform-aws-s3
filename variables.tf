variable "aws_region" {
  description = "Default AWS Region"
  default     = ""
}

# variable "owner" {
#   default = ""
# }

# variable "CustName" {
#   default = ""
# }

# variable "Cert1" {
#   default = ""
# }

# variable "Cert2" {
#   default = ""
# }

variable "bucket_name" {
  default     = ""
}

variable "bucket_policy" {
  description = "Bucket Policy"
  default     = ""
}

variable "sse_algorithm" {
  type    = string
  default = "AES256"
}

variable "s3_key_users" {
  type        = list(string)
  default     = []
}

variable "s3_bucket_resources" {
  type        = list(string)
  default     = []
}

variable "s3_sagemaker_policy_file_path" {
  type        = string
  default     = ""
}

variable "s3_bucket_backend_policy_path" {
  type        = string
  default     = ""
}


variable "retain_on_delete" {
  description = "Instruct CloudFront to simply disable the distribution instead of delete"
  default     = false
}

variable "domain_name" {
  description = "Name of the domain where record(s) need to create"
  default     = "*.my-domain-name.com"
}

variable "gateway_name" {
  default = ""
}

variable "gateway_description" {
  default = ""
}

variable "dev_usage_plan_name" {
  default = "dev Usage Plan"
}

variable "dev_usage_plan_description" {
  default = "The default dev usage plan"
}

variable "dev_quota_limit" {
  default = 2000
}

variable "dev_quota_offset" {
  default = 0
}

variable "dev_quota_period" {
  default = "DAY"
}

variable "dev_throttle_burst_limit" {
  default = 30
}

variable "dev_throttle_rate_limit" {
  default = 60
}

variable "dev_api_key_name" {
  default = "devApiKey"
}

variable "dev_api_key_type" {
  default = "API_KEY"
}

variable "shard_count" {
  default = "1"
}

variable "retention_period" {
  default = "48"
}

variable "parameter_group_name" {
  default = "default.redis2.8"
}

variable "tags" {
  type        = map(string)
  description = "optional tags"

  default = {}
}


variable "versioning_enabled" {
  description = "keep multiple versions of objects within s3 bucket"
  default     = "true"
}

variable "lifecycle_rule_enabled" {
  description = "enable lifecycle events on bucket"
  type        = string
  default     = "true"
}

variable "noncurrent_version_expiration_days" {
  description = "set expiration period for noncurrent object versions"
  type        = string
  default     = "90"
}

variable "noncurrent_version_transition_days" {
  description = "set period for noncurrent object version transitions"
  type        = string
  default     = "30"
}

variable "standard_transition_days" {
  description = "number of days to persist in the standard storage tier before moving to the infrequent access tier"
  type        = string
  default     = "30"
}

variable "glacier_transition_days" {
  description = "number of days to move data to the glacier storage tier"
  type        = string
  default     = "60"
}

variable "expiration_days" {
  description = "number of days to expunge the objects"
  type        = string
  default     = "90"
}  

variable "wait_for_capacity_timeout" {
  type    = string
  default = "10m"
}