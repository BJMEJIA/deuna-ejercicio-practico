data "aws_caller_identity" "current" {}

# Documento de política usando el data source
data "aws_iam_policy_document" "kms_policy" {
  version = "2012-10-17"
  # Statement fijo para el root de la cuenta
  statement {
    sid    = "EnableIAMUserPermissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }
    actions   = ["kms:*"]
    resources = ["*"]
  }

  # Dynamic block para cada elemento de var.kms_statements
  dynamic "statement" {
    for_each = var.kms_statements
    content {
      sid    = statement.value.sid
      effect = statement.value.effect

      principals {
        type = "AWS"
        identifiers = [
          "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${statement.value.principal_user}"
        ]
      }

      actions   = statement.value.actions
      resources = ["*"]
    }
  }
}

# Llave de Encriptación simétrica
resource "aws_kms_key" "kms_key" {
  description             = "KMS para deuna"
  enable_key_rotation     = true
  deletion_window_in_days = 20
  policy                  = data.aws_iam_policy_document.kms_policy.json

  tags = var.tags
}