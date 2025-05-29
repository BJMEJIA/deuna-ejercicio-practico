variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "s3_bucket_name" {
  type    = string
  default = "deuna-iac-bucket"
}

variable "kms_statements" {

  type = list(object({
    sid            = string       # Identificador único para cada statement
    effect         = string       # "Allow" o "Deny"
    principal_user = string       # nombre de usuario en la cuenta
    actions        = list(string) # lista de acciones kms:*
  }))

  default = [
    {
      sid            = "AllowAdministration"
      effect         = "Allow"
      principal_user = "Josue.Mejia"
      actions = [
        "kms:ReplicateKey",
        "kms:Create*",
        "kms:Describe*",
        "kms:Enable*",
        "kms:List*",
        "kms:Put*",
        "kms:Update*",
        "kms:Revoke*",
        "kms:Disable*",
        "kms:Get*",
        "kms:Delete*",
        "kms:ScheduleKeyDeletion",
        "kms:CancelKeyDeletion"
      ]
    }
  ]

}

variable "tags" {

  type = map(string)

  default = {
    env = "development"
    app = "deuna"
  }

}

variable "instance_class" {
  type = string

  default = "db.r6g.large"
}

variable "database_name" {
  type = string

  default = "db_database_deuna"
}

variable "db_cluster_identifier" {
  type = string

  default = "aurora-postgresql-deuna"
}

variable "db_master_username" {
  type    = string
  default = "pgadmin"
}

# variable "db_master_password" {
#   type      = string
#   sensitive = true
# }

variable "instances_count" {
  type = number

  default = 1
}