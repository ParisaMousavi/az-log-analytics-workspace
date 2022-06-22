//
// this file will be overwritten by terragrunt
//
// used only for unit tests - hence no defaults
//

variable "tags" {
  type        = map(string)
  description = "(provided by Terragrunt)"
}

# variable "resource_long_name" {
#   type        = string
#   description = "(provided by Terragrunt)"
# }

variable "resource_short_name" {
  type        = string
  description = "(provided by Terragrunt)"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group as exported by the az-resourcegroup module."
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group as exported by the az-resourcegroup module."
}