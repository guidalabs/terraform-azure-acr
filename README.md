# terraform-azure-acr

Azure Container Registry (ACR) allows you to build, store, and manage container images and artifacts in a private registry for all types of container deployments.

This module allows you to create an Azure Container Registry which can be either publicly available (authorized IP ranges), privately available (private endpoint) or both.

When private endpoint is enabled a private endpoint, private dns zone and a private dns zone vnet link will be created. Clients in the associated vnet will connect to the ACR via the private endpoint with the same url that will be used externally.

## Usage

```hcl
module "acr" {
  source                     = "guidalabs/terraform-azure-acr"
  acr_name                   = "guidadev1"
  resource_group_name        = azurerm_resource_group.main.name
  location                   = local.location
  acr_admin_enabled          = true
  acr_authorized_ip_ranges   = ["1.1.1.1/32""]
  private_endpoint_enabled   = true
  subnet_id_private_endpoint = module.network.vnet_subnets[0]
  vnet_id_private_endpoint   = module.network.vnet_id
}
```

If you need to give AKS permission to pull images from the ACR:

```hcl
resource "azurerm_role_assignment" "aks-acr-assignment-pull" {
  scope                = module.acr.id
  role_definition_name = "AcrPull"
  principal_id         = module.aks.kubelet_identity.0.object_id
}
```

See [Configuration](configuration.md)
