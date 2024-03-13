# Variable declaration with default values
variable "workspace_name" {
  type        = string
  description = "Terraform project name."
  default     = "cr460-de01-dev"
}

variable "workspace_tags" {
  # Tags should be in the form ["tag1", "tag2", ...]
  type        = list(string)
  description = "Terraform project tags."
  default     = ["polymtl", "dev"]
}

resource "tfe_workspace" "workspace" {
  # The project the workspace will be member of
  project_id             = tfe_project.project.id
  name                   = var.workspace_name
  organization           = tfe_organization.org.name
  tag_names              = var.workspace_tags
  auto_apply             = true
  auto_apply_run_trigger = true

  lifecycle {
    ignore_changes = [
      vcs_repo
    ]
  }
}
