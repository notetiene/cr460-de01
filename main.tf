variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

# The configuration for the `remote` backend.
terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "polymtl-cr460"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "cr460-de01"
    }
  }
}

resource "azurerm_resource_group" "cr460-de01" {
  name     = "cr460-de01-resources"
  location = "Canada East"
}

resource "azurerm_virtual_network" "cr460-de01" {
  name                = "cr460-de01-network"
  location            = azurerm_resource_group.cr460-de01.location
  resource_group_name = azurerm_resource_group.cr460-de01.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["1.1.1.1", "1.0.0.1"]

  subnet {
    # P = #x50
    name           = "PolyMTL"
    address_prefix = "10.0.120.0/24"
  }

  tags = {
    environment = "cr460"
  }
}
