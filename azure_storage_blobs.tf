resource "azurerm_storage_account" "sta_main" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "blob_container" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.sta_main.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blobs" {
  name                   = "blob-worker"
  storage_account_name   = azurerm_storage_account.sta_main.name
  storage_container_name = azurerm_storage_container.blob_container.name
  type                   = "Block"

}