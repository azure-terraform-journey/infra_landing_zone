terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }

  backend "azurerm" {
    resource_group_name  = "infra_rg"
    storage_account_name = "stgsan123"
    container_name       = "containersan"
    key                  = "prod.tfstate"
  }
}

provider "azurerm" {
  features {}
}
