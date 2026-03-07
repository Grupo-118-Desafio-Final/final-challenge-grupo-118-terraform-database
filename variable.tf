variable "admin_login" {
  type      = string
  sensitive = true
}

variable "admin_password" {
  type      = string
  sensitive = true
}

#region Atlas Organization ID
variable "atlas_org_id" {
  type        = string
  description = "Atlas organization id"
  default     = ""
}

variable "mongodb_atlas_public_key" {
  type      = string
  sensitive = true
}

variable "mongodb_atlas_private_key" {
  type      = string
  sensitive = true
}
#endregion


#region Videos
variable "video_domain" {
  type    = string
  default = "videos"
}
#endregion

#region Billing
variable "billing_domain" {
  type    = string
  default = "billing"
}
#endregion

#region Users and Plans

variable "resource_group_name" {
  description = "The name of the resource group where resources will be created"
  type        = string
  default     = "final-challange-grupo-118-db-rg"
}

variable "resource_group_location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "eastus2"
}

variable "server_name" {
  type        = string
  description = "SQL Server Name"
  default     = "final-challenge-grupo-118-sqlserver"
}

variable "backoffice_database_name" {
  type        = string
  description = "Nome do banco de dados do Backoffice"
  default     = "final-challenge-grupo-118-backoffice"
}

variable "sku_name" {
  type        = string
  description = "Sku Name"
  default     = "S0"
}

variable "client_ip" {
  type        = string
  description = "Client IP para liberar no firewall"
}
#endregion