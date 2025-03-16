variable "bucket" {
  type        = object({
    name        = string
    environment = string
  })
  description = "Informações do bucket"

  validation {
    condition     = contains(["production", "staging", "development"], var.bucket.environment)
    error_message = "O valor para 'Environment' deve ser um dos seguintes: 'production', 'staging' ou 'development'."
  }

  validation {
    condition     = length(var.bucket.name) >= 3 && length(var.bucket.name) <= 63
    error_message = "O bucket deve ter um nome único entre 3 e 63 caracteres, ref: https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html"
  }
}

