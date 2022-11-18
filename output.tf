output "id" {
  value = azurerm_log_analytics_workspace.this.id
}

output "name" {
  value = azurerm_log_analytics_workspace.this.name
}

output "containerinsights_sln_id" {
  value = azurerm_log_analytics_solution.this.id
}
