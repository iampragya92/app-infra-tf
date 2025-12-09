terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-backend"
    storage_account_name = "aibasedtodo"
    container_name       = "tfstate"
    key                  = "github.tf.tfstate"
  }
}


provider "azurerm" {
  features {}
  subscription_id = "1f196f8e-ab8f-4746-a1f5-1798c2228e8f"
}
