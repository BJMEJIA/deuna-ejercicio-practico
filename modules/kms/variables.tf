variable "kms_statements" {
  description = "Lista de declaraciones KMS a inyectar"
  type = list(object({
    sid            = string       # Identificador único para cada statement
    effect         = string       # "Allow" o "Deny"
    principal_user = string       # nombre de usuario en la cuenta
    actions        = list(string) # lista de acciones kms:*
  }))
}

variable "tags" {
  type = map(string)
}