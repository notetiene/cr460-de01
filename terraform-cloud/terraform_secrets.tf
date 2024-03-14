# Variable declaration with default values
variable "subscription_id" {
  # The value should not be displayed
  sensitive   = true
  type        = string
  description = "Azure subscription ID."
}

variable "client_id" {
  # The value should not be displayed
  sensitive   = true
  type        = string
  description = "Azure client ID."
}

variable "client_secret" {
  # The value should not be displayed
  sensitive   = true
  type        = string
  description = "Azure client secret."
}

variable "tenant_id" {
  # The value should not be displayed
  sensitive   = true
  type        = string
  description = "Azure tenant ID."
}

resource "tfe_variable" "subscription_id" {
  # The value should not be displayed
  sensitive    = true
  key          = "subscription_id"
  value        = var.subscription_id
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "client_id" {
  # The value should not be displayed
  sensitive    = true
  key          = "client_id"
  value        = var.client_id
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "client_secret" {
  # The value should not be displayed
  sensitive    = true
  key          = "client_secret"
  value        = var.client_secret
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_variable" "tenant_id" {
  # The value should not be displayed
  sensitive    = true
  key          = "tenant_id"
  value        = var.tenant_id
  category     = "terraform"
  workspace_id = tfe_workspace.workspace.id
}
