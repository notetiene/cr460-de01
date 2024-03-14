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

# Azure variables
variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
  sensitive   = true
}
variable "client_id" {
  description = "Azure client ID."
  type        = string
  sensitive   = true
}
variable "client_secret" {
  description = "Azure client secret."
  type        = string
  sensitive   = true
}
variable "tenant_id" {
  description = "Azure tenant ID."
  type        = string
  sensitive   = true
}

# Azure provider configuration
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = "cr460-de01-rg"
  location = "Canada East"
}
