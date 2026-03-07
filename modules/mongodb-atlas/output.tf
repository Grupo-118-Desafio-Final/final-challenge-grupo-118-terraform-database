output "project_id" {
  value = mongodbatlas_project.project.id
}

output "cluster_name" {
  value = mongodbatlas_cluster.cluster.name
}

output "cluster_connection_strings" {
  value = mongodbatlas_cluster.cluster.connection_strings
}