terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                 = "2e13d8ea-aa7e-4e3d-8fc3-0b9f18dd80f7"
  resource_provider_registrations = "none"
}