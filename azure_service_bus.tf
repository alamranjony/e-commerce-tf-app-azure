resource "azurerm_servicebus_namespace" "main" {
  name                = "sbns-${local.project}-${local.env}-101"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Standard"

  tags = {
    source = "terraform"
  }
}

locals {
  queue_names = {
    "microservices-queue" = {
      queue_name = "robotshop-queue"
    }
  }
}

resource "azurerm_servicebus_queue" "sbns_queue" {
  for_each            = local.queue_names
  name                = each.value.queue_name
  namespace_id        = azurerm_servicebus_namespace.main.id
}

resource "azurerm_servicebus_namespace_authorization_rule" "sbns-ar" {
  name         = "sbns-auth-rule"
  namespace_id = azurerm_servicebus_namespace.main.id

  listen = true
  send   = true
  manage = true
}