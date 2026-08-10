terraform {
  required_version = ">= 1.8.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"


    }
  }

  
  backend "azurerm" {
    resource_group_name  = "rg-landing-zone"             
        storage_account_name = "landingzonestorage12334" 
        container_name       = "tfstate"              
    key                  = "uat.terraform.tfstate" 
  }
}

provider "azurerm" {
  features {

  }

}