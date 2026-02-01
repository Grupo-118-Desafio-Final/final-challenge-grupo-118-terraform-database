output "redis_hostname" {
  description = "The hostname of the Azure Redis Cache instance."
  value       = azurerm_redis_cache.grupo118finalchallengeinfradbredis.hostname
}

output "redis_port" {
  description = "The port of the Azure Redis Cache instance."
  value       = azurerm_redis_cache.grupo118finalchallengeinfradbredis.port
}

output "redis_primary_access_key" {
  description = "The primary access key for the Azure Redis Cache instance."
  value       = azurerm_redis_cache.grupo118finalchallengeinfradbredis.primary_access_key
  sensitive = true
}

output "redis_primary_connection_string" {
  description = "The primary connection string for the Azure Redis Cache instance."
  value       = azurerm_redis_cache.grupo118finalchallengeinfradbredis.primary_connection_string
  sensitive = true
}