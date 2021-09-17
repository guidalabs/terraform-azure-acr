## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.46 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.77.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_private_dns_zone.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_admin_enabled"></a> [acr\_admin\_enabled](#input\_acr\_admin\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_acr_authorized_ip_ranges"></a> [acr\_authorized\_ip\_ranges](#input\_acr\_authorized\_ip\_ranges) | List of network CIDR's that are allowed to connect to the registry | `list(any)` | `null` | no |
| <a name="input_acr_identity_ids"></a> [acr\_identity\_ids](#input\_acr\_identity\_ids) | A list of User Managed Identity ID's which should be assigned to the Container Registry | `list(any)` | `null` | no |
| <a name="input_acr_identity_type"></a> [acr\_identity\_type](#input\_acr\_identity\_type) | The type of Managed Identity which should be assigned to the Container Registry. Possible values are SystemAssigned, UserAssigned | `string` | `"UserAssigned"` | no |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"westeurope"` | no |
| <a name="input_network_default_action"></a> [network\_default\_action](#input\_network\_default\_action) | Deny or Allow traffic to the ACR by default. If you choose Deny, a list of authorized IP ranges should be configured | `string` | `"Deny"` | no |
| <a name="input_private_endpoint_enabled"></a> [private\_endpoint\_enabled](#input\_private\_endpoint\_enabled) | If private\_endpoint is enabled clients can access the ACR over a private endpoint in their vnet. The clients don't have to be whitelisted in the authorized IP ranges | `bool` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_subnet_id_private_endpoint"></a> [subnet\_id\_private\_endpoint](#input\_subnet\_id\_private\_endpoint) | n/a | `string` | `null` | no |
| <a name="input_vnet_id_private_endpoint"></a> [vnet\_id\_private\_endpoint](#input\_vnet\_id\_private\_endpoint) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the created Azure Container Registry (ACR). |
