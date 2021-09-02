variable "bucket_name" {
  description = "development name of the bucket that will use as origin for CDN"
  # default     = ""
}

variable "aws_region" {
  description = "ec2 region for the vpc"
  # default     = ""
}

variable "sse_algorithm" {
  type    = string
  # default = ""
}

variable "tags" {
  type        = map(string)
  description = "optional tags"
  default = {}
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

variable "bucket_policy" {
  type        = string
  default     = ""
}

variable "s3_bucket_backend_policy_path" {
  type        = string
  default     = ""
}
