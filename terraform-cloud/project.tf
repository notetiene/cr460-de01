# Variable declaration with default values
variable "project_name" {
  type        = string
  description = "Terraform project."
  default     = "cr460-de01"
}

# Create a new terraform cloud project
resource "tfe_project" "project" {
  organization = tfe_organization.org.name
  name         = var.project_name
}
