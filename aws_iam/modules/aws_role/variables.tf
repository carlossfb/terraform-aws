
variable "iam_role_configs" {
  type = object({
    name                 = string
    max_session_duration = optional(number, 1)
    statement = list(object({
      identifiers = list(string)
      effect      = optional(string, "Allow")
      type        = optional(string, "Service")
      actions     = optional(list(string), ["sts:AssumeRole"])
    }))
  })

  description = "Configuracoes basicas da role."

  validation {
    condition     = (length(var.iam_role_configs.name) > 0 && length(var.iam_role_configs.statement) > 0)
    error_message = "O nome e as declarações (statement) são obrigatórios."
  }

  validation {
    condition     = (alltrue([for s in var.iam_role_configs.statement : (contains(["Allow", "Deny"], s.effect) && length(s.actions) > 0)]))
    error_message = "Cada declaração deve ter um 'effect' válido (Allow/Deny) e ações não vazias."
  }
}

variable "iam_policies" {
  type = object({
    name        = string
    description = optional(string, null)
    statement = list(object({
      sid       = optional(string, null)
      effect    = optional(string, "Allow")
      actions   = list(string)
      resources = optional(list(string), ["*"])
    }))
  })
  description = "Politicas para atribuir a role"
}

