resource "azurerm_service_plan" "appservice_plan" {
  name                = "microservices-appservice-plan"
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "frontend" {
  name                = "microservices-frontend"
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name
  service_plan_id     = azurerm_service_plan.appservice_plan.id

  site_config {
    always_on = true
  }
}
