#region MongoDb for Videos Database
module "mongodb_atlas_videos" {
  source = "./modules/mongodb-atlas"

  atlas_org_id       = var.atlas_org_id
  atlas_project_name = var.video_domain
  cluster_name       = "${var.video_domain}-cluster"
}

module "mongodb_user_pass_videos" {
  source = "./modules/mongodb-user-pass"

  project_id         = module.mongodb_atlas_videos.project_id
  atlas_project_name = var.video_domain
  admin_login        = "${var.admin_login}-${var.video_domain}"
  admin_password     = var.admin_password

}
#endregion

# region SQL Server
module "infra_database_resource_group" {
  source   = "./modules/azure-resource-group"
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "sql_server" {
  source              = "./modules/azure-server"
  name                = var.server_name
  resource_group_name = module.infra_database_resource_group.name
  location            = module.infra_database_resource_group.location
  admin_login         = var.admin_login
  admin_password      = var.admin_password
  client_ip           = var.client_ip
}
# endregion

#region Backoffice Database
module "backoffice_database" {
  source    = "./modules/azure-database"
  name      = var.backoffice_database_name
  server_id = module.sql_server.id
  sku_name  = var.sku_name
}
#endregion

#region Redis Cache

module "redis_cache" {
  source              = "./modules/azure-redis-cache"
  resource_group_name = module.infra_database_resource_group.name
  location            = module.infra_database_resource_group.location
}

output "redis_hostname" {
  value = module.redis_cache.redis_hostname
}

output "redis_port" {
  value = module.redis_cache.redis_port
}

output "redis_primary_access_key" {
  value     = module.redis_cache.redis_primary_access_key
  sensitive = true
}

output "redis_primary_connection_string" {
  value     = module.redis_cache.redis_primary_connection_string
  sensitive = true
}

#endregion
