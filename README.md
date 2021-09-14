To start implementing your module, just extend the existing input.tf, main.tf and output.tf. If you create sub modules, please copy this structure into the modules' sub folder.

This module is tagged with semantic versions via semantic-release, please refer to [this doucmentation](https://azure-docs-dev.dev.interhyp-cloud.de/modules/semantic-versioning/) when committing changes.

Please update this README with 
``terraform-docs markdown .``
and format all code with 
``terraform fmt -recursive``
after making changes to the modul.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_solution.Sentinel](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_solution) | resource |
| [azurerm_log_analytics_workspace.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | Location of the resource group as exported by the az-resourcegroup module. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group as exported by the az-resourcegroup module. | `string` | n/a | yes |
| <a name="input_resource_long_name"></a> [resource\_long\_name](#input\_resource\_long\_name) | (provided by Terragrunt) | `string` | n/a | yes |
| <a name="input_resource_short_name"></a> [resource\_short\_name](#input\_resource\_short\_name) | (provided by Terragrunt) | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Log analytics workspace data rentention in days. Possible values for Free 7 days. Or range 30 - 730 | `number` | `90` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | Log analytics workspace sku | `string` | `"PerGB2018"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (provided by Terragrunt) | `map(string)` | n/a | yes |

## Outputs

No outputs.

***
## References

