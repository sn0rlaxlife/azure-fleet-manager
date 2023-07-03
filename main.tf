terraform {
  required_version = ">=1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0, < 4.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
  }
}
provider "azurerm" {
  features {}

}

provider "kubectl" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
}
}
resource "azurerm_resource_group" "fleet" {
  name     = "fleet-rg"
  location = "East US"
}

resource "azurerm_resource_group" "fleet2" {
  name     = "fleet-rg2"
  location = "East US"
}


#creates a vnet/subnet with the ability to use the mapping as shown see ref https://registry.terraform.io/modules/Azure/subnets/azurerm/latest
module "aks-vnet" {
  source              = "Azure/subnets/azurerm"
  version             = "1.0.0"
  resource_group_name = azurerm_resource_group.fleet.name
  subnets = {
    subnet0 = {
      address_prefixes = ["10.52.0.0/24"]
    }
  }
  virtual_network_address_space = ["10.52.0.0/16"]
  virtual_network_location      = var.region
  virtual_network_name          = "fleet-azure-vnet"
}

#creates a vnet/subnet with the ability to use the mapping as shown see ref https://registry.terraform.io/modules/Azure/subnets/azurerm/latest
module "aks-vnet2" {
  source              = "Azure/subnets/azurerm"
  version             = "1.0.0"
  resource_group_name = azurerm_resource_group.fleet2.name
  subnets = {
    subnet0 = {
      address_prefixes = ["10.0.0.0/24"]
    }
  }
  virtual_network_address_space = ["10.0.0.0/16"]
  virtual_network_location      = var.region
  virtual_network_name          = "fleet-azure-vnet2"
}

