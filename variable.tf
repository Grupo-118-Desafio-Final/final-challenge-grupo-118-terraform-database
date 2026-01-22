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