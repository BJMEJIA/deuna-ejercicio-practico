variable "db_master_username" {
  type    = string
}

variable "db_master_password" {
  type      = string
  sensitive = true
}

variable "kms_master_key_id" {
  type = string
}