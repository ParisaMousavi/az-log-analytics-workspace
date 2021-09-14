//
// this file should contain all your resources
//

resource "azurerm_log_analytics_workspace" "main" {
  name                = "${var.resource_short_name}-ws"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
}

resource "azurerm_log_analytics_solution" "Sentinel" {
  solution_name         = "SecurityInsights"
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.main.id
  workspace_name        = azurerm_log_analytics_workspace.main.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SecurityInsights"
  }
}