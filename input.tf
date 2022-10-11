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