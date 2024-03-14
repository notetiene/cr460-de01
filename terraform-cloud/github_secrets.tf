# Variable declaration with default values
variable "gh_repo" {
  type        = string
  description = "GitHub repository."
  default     = "cr460-de01"
}

variable "secret_name" {
  type        = string
  description = "GitHub Actions secret name."
  default     = "TF_API_TOKEN"
}

variable "secret_value" {
  # The value should not be displayed
  sensitive   = true
  type        = string
  description = "GitHub Actions secret value."
}

# Create a GitHub Actions secret on repository
resource "github_actions_secret" "secret" {
  repository      = var.gh_repo
  secret_name     = var.secret_name
  plaintext_value = var.secret_value
}
