output "sql_server_id" {
  value       = module.sql_server.id
  description = "The sql server id created by the module"
}

output "infra_database_resource_group_name" {
  value       = module.infra_database_resource_group.name
  description = "The name of the resource group created by the module"
}

output "infra_database_resource_group_location" {
  value       = module.infra_database_resource_group.location
  description = "The location of the resource group created by the module"
}

output "videos_mongo_connection_strings" {
  value       = module.mongodb_atlas_videos.cluster_connection_strings
  description = "The connection strings for the videos mongo cluster"
}