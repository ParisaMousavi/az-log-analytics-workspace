//
// this file should contain all your input variables
//

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