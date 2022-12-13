output "id" {
  value = azurerm_log_analytics_workspace.this.id
}

output "name" {
  value = azurerm_log_analytics_workspace.this.name
}

output "containerinsights_sln_id" {
  value = var.with_containerinsights_enabled == true ? azurerm_log_analytics_solution.this[0].id : null
}
