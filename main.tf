resource "azurerm_log_analytics_workspace" "this" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  sku                             = var.sku
  retention_in_days               = var.retention_in_days
  internet_ingestion_enabled      = var.internet_ingestion_enabled
  internet_query_enabled          = var.internet_query_enabled
  local_authentication_disabled   = var.local_authentication_disabled
  allow_resource_only_permissions = var.allow_resource_only_permissions
  daily_quota_gb                  = var.daily_quota_gb
  cmk_for_query_forced            = var.cmk_for_query_forced
  tags = merge(
    var.additional_tags,
    {
      created-by = "iac-tf"
    },
  )
}

resource "azurerm_log_analytics_solution" "this" {
  count                 = var.with_containerinsights_enabled == true ? 1 : 0
  solution_name         = "ContainerInsights(${var.name})"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.this.id
  workspace_name        = azurerm_log_analytics_workspace.this.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "logs-metrics-2-workspace"
  target_resource_id         = azurerm_log_analytics_workspace.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id != null ? var.log_analytics_workspace_id : azurerm_log_analytics_workspace.this.id

  enabled_log {
    category = "audit"

    retention_policy {
      enabled = true
    }
  }
  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
    }
  }
}
