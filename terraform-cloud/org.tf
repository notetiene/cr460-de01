# Variable declaration with default values
variable "org_name" {
  type        = string
  description = "Terraform organization name."
  default     = "polymtl-cr460"
}

variable "org_email" {
  type        = string
  description = "Terraform organization email."
  default     = "e.e.f.prudhomme@gmail.com"
}

# Create a new terraform cloud organization
resource "tfe_organization" "org" {
  name  = var.org_name
  email = var.org_email
}
