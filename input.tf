variable "sku" {
  description = "Log analytics workspace sku"
  type        = string
  default     = "Free"

  validation {
    condition     = contains(["Free", "PerNode", "Premium", "Standard", "Standalone", "Unlimited", "PerGB2018"], var.sku)
    error_message = "Invalid value for sku."
  }
}

variable "retention_in_days" {
  description = "Log analytics workspace data rentention in days. Possible values for Free 7 days. Or range 30 - 730"
  type        = number
  default     = 7
}

variable "name" {
  type = string
}

variable "tags" {
  type        = map(string)
  description = "(provided by Terragrunt)"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group as exported by the az-resourcegroup module."
}

variable "location" {
  type        = string
  description = "Location of the resource group as exported by the az-resourcegroup module."
}

variable "additional_tags" {
  default     = {}
  description = "Additional resource tags"
  type        = map(string)
}

variable "with_containerinsights_enabled" {
  description = "This is for azurerm_log_analytics_solution"
  type        = bool
  default     = false
}

variable "internet_ingestion_enabled" {
  type    = bool
  default = true
}

variable "internet_query_enabled" {
  type    = bool
  default = true
}

variable "local_authentication_disabled" {
  type    = bool
  default = false
}

variable "allow_resource_only_permissions" {
  type    = bool
  default = true
}

variable "daily_quota_gb" {
  description = "-1 (unlimited)"
  type        = number
  default     = 0.25
}

variable "cmk_for_query_forced" {
  type    = bool
  default = false
}

variable "log_analytics_workspace_id" {
  description = "by default self-inject if not null will inject to other lAW"
  type        = string
  default     = null
}