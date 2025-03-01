variable "existing_resource_group_name" {
  description = "Name of existing resource group to deploy resources into"
  type        = string
  default     = null
}

variable "location" {
  description = "Target Azure location to deploy the resource"
  type        = string
  default     = "UK South"
}

variable "name" {
  description = "The default name will be product+component+env, you can override the product+component part by setting this"
  type        = string
  default     = null
}

variable "mssql_version" {
  description = "The version of MSSQL to use."
  type        = string
  default     = "12.0"
}

variable "mssql_admin_username" {
  description = "The username of the admin account, default is 'sqladmin'."
  type        = string
  default     = "sqladmin"
}

variable "mssql_admin_password" {
  description = "The password of the admin account, if a value is not provided one will be generated."
  type        = string
  sensitive   = true
  default     = null
}

variable "minimum_tls_version" {
  description = "The minimum TLS version."
  type        = string
  default     = "1.2"
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for MSSQL server."
  type        = bool
  default     = false
}

variable "user_assigned_identity_ids" {
  description = "List of object IDs of user assigned managed identities to assign to MSSQL server."
  type        = list(string)
  default     = []
}

variable "enable_system_assigned_identity" {
  description = "Whether to enable system assigned managed identity for MSSQL server."
  type        = bool
  default     = true
}

variable "mssql_databases" {
  description = "Map of objects representing the databases to create on the MSSQL server."
  type = map(object({
    collation                   = optional(string)
    license_type                = optional(string, "LicenseIncluded")
    max_size_gb                 = optional(number, 1)
    sku_name                    = optional(string, "Basic")
    zone_redundant              = optional(bool, false)
    create_mode                 = optional(string, "Default")
    min_capacity                = optional(number)
    geo_backup_enabled          = optional(bool, false)
    auto_pause_delay_in_minutes = optional(number, -1)
  }))
  default = {}
}

variable "enable_private_endpoint" {
  description = "Whether to deploy a private endpoint for the MSSQL server. This allows for a terraform plan in a 'clean' environment."
  type        = bool
  default     = false
}

variable "private_endpoint_subnet_id" {
  description = "The subnet ID to deploy the private endpoint into."
  type        = string
  default     = null
}

variable "admin_group" {
  description = "The name of the Azure AD group that will be granted admin access to the MSSQL server."
  type        = string
  default     = null
}

variable "private_dns_zone_ids" {
  description = "List of private DNS zone IDs to associate with the private endpoint."
  type        = list(string)
  default     = []

}
