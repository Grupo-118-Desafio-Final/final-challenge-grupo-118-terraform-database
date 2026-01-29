#region MongoDb for Videos Database
module "mongodb_atlas_videos" {
  source = "./modules/mongodb-atlas"

  atlas_org_id       = var.atlas_org_id
  atlas_project_name = "${var.video_domain}"
  cluster_name       = "${var.video_domain}-cluster"
}

module "mongodb_user_pass_videos" {
  source = "./modules/mongodb-user-pass"

  project_id         = module.mongodb_atlas_videos.project_id
  atlas_project_name = "${var.video_domain}"
  admin_login        = "${var.admin_login}-${var.video_domain}"
  admin_password     = var.admin_password

}
#endregion


#region MongoDb for Billing Database

module "mongodb_atlas_billing" {
  source = "./modules/mongodb-atlas"

  atlas_org_id       = var.atlas_org_id
  atlas_project_name = "${var.billing_domain}"
  cluster_name       = "${var.billing_domain}-cluster"
}

module "mongodb_user_pass_billing" {
  source = "./modules/mongodb-user-pass"

  project_id         = module.mongodb_atlas_billing.project_id
  atlas_project_name = "${var.billing_domain}"
  admin_login        = "${var.admin_login}-${var.billing_domain}"
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

#region Keycloak Database
module "keycloak_database" {
  source    = "./modules/azure-database"
  name      = var.keycloak_database_name
  server_id = module.sql_server.id
  sku_name  = var.sku_name
}
#endregion