data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "ml_rg" {
  location = var.resource_group_location
  name = var.azure_rg_name
}

resource "azurerm_application_insights" "app_in_ml" {
  name                = "workspace-dev-ai"
  location            = azurerm_resource_group.ml_rg.location
  resource_group_name = azurerm_resource_group.ml_rg.name
  application_type    = "web"
}


resource "azurerm_key_vault" "akv_ml" {
  name                = "workspacedevkeyvault"
  location            = azurerm_resource_group.ml_rg.location
  resource_group_name = azurerm_resource_group.ml_rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "premium"
}

resource "azurerm_storage_account" "asa_ml" {
  # Need to be unique each time
  name                     = "amlworkspace10312024"
  location                 = azurerm_resource_group.ml_rg.location
  resource_group_name      = azurerm_resource_group.ml_rg.name
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_machine_learning_workspace" "amlw" {
  name                    = "dev-workspace"
  location                = azurerm_resource_group.ml_rg.location
  resource_group_name     = azurerm_resource_group.ml_rg.name
  application_insights_id = azurerm_application_insights.app_in_ml.id
  key_vault_id            = azurerm_key_vault.akv_ml.id
  storage_account_id      = azurerm_storage_account.asa_ml.id

  identity {
    type = "SystemAssigned"
  }
}