#region MongoDb for Videos Database
module "mongodb_atlas_videos" {
  source = "./modules/mongodb-atlas"

  atlas_org_id       = var.atlas_org_id
  atlas_project_name = "${var.video_domain}"
  cluster_name       = "${var.video_domain}-cluster"
}
#endregion

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
#endregion

module "mongodb_user_pass_billing" {
  source = "./modules/mongodb-user-pass"

  project_id         = module.mongodb_atlas_billing.project_id
  atlas_project_name = "${var.billing_domain}"
  admin_login        = "${var.admin_login}-${var.billing_domain}"
  admin_password     = var.admin_password

}
#endregion