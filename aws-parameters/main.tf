resource "aws_ssm_parameter" "parameters" {
  count = length(var.parameters)
  name  = var.parameters[count.index].name
  value = var.parameters[count.index].value
  type  = var.parameters[count.index].type
}

resource "aws_ssm_parameter" "secrets" {
  count = length(var.secrets)
  name  = var.secrets[count.index].name
  value = var.secrets[count.index].value
  type  = var.secrets[count.index].type
}

variable "parameters" {}
variable  "secrets"   {}
