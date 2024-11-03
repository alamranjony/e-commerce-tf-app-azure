data "azurerm_subscription" "current" {
}

data "azurerm_client_config" "current" {}

# # created in tf-git
# data "azuredevops_project" "project" {
#   name = "robotshop"
# }