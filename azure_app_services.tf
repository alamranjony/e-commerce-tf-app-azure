resource "azurerm_app_service_plan" "appservice_plan" {
  name                = "microservices-appservice-plan"
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name
  kind                = "App"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "frontend" {
  name                = "microservices-frontend"
  location            = local.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.appservice_plan.id

  site_config {
    always_on = true
  }
}
