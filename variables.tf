variable "acr_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "acr_admin_enabled" {
  type    = bool
  default = true
}

variable "network_default_action" {
  type        = string
  description = "Deny or Allow traffic to the ACR by default. If you choose Deny, a list of authorized IP ranges should be configured"
  default     = "Deny"
}

variable "acr_identity_type" {
  type        = string
  description = "The type of Managed Identity which should be assigned to the Container Registry. Possible values are SystemAssigned, UserAssigned"
  default     = "UserAssigned"
}

variable "acr_identity_ids" {
  type        = list(any)
  description = "A list of User Managed Identity ID's which should be assigned to the Container Registry"
  default     = null
}

variable "acr_authorized_ip_ranges" {
  type        = list(any)
  description = "List of network CIDR's that are allowed to connect to the registry"
  default     = null
}

variable "private_endpoint_enabled" {
  type        = bool
  description = "If private_endpoint is enabled clients can access the ACR over a private endpoint in their vnet. The clients don't have to be whitelisted in the authorized IP ranges"
  default     = null
}

variable "subnet_id_private_endpoint" {
  type    = string
  default = null
}

variable "vnet_id_private_endpoint" {
  type    = string
  default = null
}

variable "tags" {
  type        = map(string)
  description = "Any tags can be set"
  default     = {}
}