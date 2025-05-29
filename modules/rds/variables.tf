variable "tags" {
  type = map(string)
}

variable "db_cluster_identifier" {
  type = string
}

variable "db_master_username" {
  type = string
}

variable "kms_master_key_id" {
  type = string
}

variable "database_name" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "instances_count" {
  type = number
}