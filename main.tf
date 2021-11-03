resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = var.acr_admin_enabled

  identity {
    type         = var.acr_identity_type
    identity_ids = var.acr_identity_ids
  }

  network_rule_set {
    count          = var.network_default_deny ? 1 : 0
    default_action = var.network_default_action
    ip_rule = [
      for ip in var.acr_authorized_ip_ranges : {
        action   = "Allow"
        ip_range = ip
      }
    ]
  }

  tags = var.tags
}

resource "azurerm_private_dns_zone" "acr" {
  count               = var.private_endpoint_enabled ? 1 : 0
  name                = "azurecr.io"
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "acr" {
  depends_on            = [azurerm_private_dns_zone.acr]
  count                 = var.private_endpoint_enabled ? 1 : 0
  name                  = var.acr_name
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = "azurecr.io"
  virtual_network_id    = var.vnet_id_private_endpoint

  tags = var.tags
}

resource "azurerm_private_endpoint" "acr" {
  count               = var.private_endpoint_enabled ? 1 : 0
  name                = var.acr_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id_private_endpoint

  private_dns_zone_group {
    name                 = "private-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.acr[0].id]
  }

  private_service_connection {
    name                           = "private-sevice-connection"
    private_connection_resource_id = azurerm_container_registry.acr.id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }

  tags = var.tags
}
