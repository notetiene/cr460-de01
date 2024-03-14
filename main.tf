# Enforce using Terraform cloud
terraform {
  # Note: this block cannot take variables
  backend "remote" {
    organization = "polymtl-cr460"

    workspaces {
      name = "cr460-de01-dev"
    }
  }
}
