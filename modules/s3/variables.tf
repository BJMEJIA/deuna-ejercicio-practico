variable "tags" {
  type = map(string)
}

variable "kms_master_key_id" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}