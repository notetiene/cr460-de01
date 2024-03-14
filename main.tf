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

resource "azurerm_virtual_network" "vnet" {
  name                = "cr460-de01-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
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

resource "azurerm_network_interface" "nic0" {
  name                = "cr460-de01-nic0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    # Access inner subnet of virtual network
    subnet_id                     = azurerm_virtual_network.vnet.subnet.*.id[0]
    name                          = "conf"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "cr460-de01-vm"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  size                            = "Standard_F2"
  admin_username                  = "etienne"
  disable_password_authentication = true
  network_interface_ids = [
    azurerm_network_interface.nic0.id,
  ]

  admin_ssh_key {
    username   = "etienne"
    public_key = file("./cr640-de01.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}
