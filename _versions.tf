terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.7"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstatelibrary"
    container_name       = "tfstate"
    key                  = "robotshop"
  }
}

provider "random" {

}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    # api_management {
    #   purge_soft_delete_on_destroy = true
    #   recover_soft_deleted         = false
    # }
  }
}

# provider "auth0" {
#   alias     = "customer"
#   api_token = var.auth0_customer_api_token
#   domain    = var.auth0_customer_domain
# }

# provider "azuredevops" {
#   org_service_url       = var.ado_org_service_url
#   # personal_access_token = var.ado_pat
#   # Authentication through PAT defined with AZDO_PERSONAL_ACCESS_TOKEN 
# }

# provider "azuread" {
# }