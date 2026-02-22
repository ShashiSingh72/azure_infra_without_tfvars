terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "4.58.0"
        }
    }
}
provider "azurerm" {
    features {}
    subscription_id = "6b2f31e8-a07f-4c80-9dc7-ab639109055d"
}