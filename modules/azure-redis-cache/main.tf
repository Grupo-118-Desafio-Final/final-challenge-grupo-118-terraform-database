# NOTE: the Name used for Redis needs to be globally unique
resource "azurerm_redis_cache" "grupo118finalchallengeinfradbredis" {
  name                 = "grupo118finalchallengeinfradbredis"
  location             = var.location
  resource_group_name  = var.resource_group_name
  capacity             = 0
  family               = "C"
  sku_name             = "Basic"
  non_ssl_port_enabled = true
  minimum_tls_version  = "1.2"
}
