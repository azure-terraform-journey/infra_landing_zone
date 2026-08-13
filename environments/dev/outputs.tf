output "resource_groups" {
  description = "Map of created resource groups"
  value       = module.resource_group.resource_groups
}

output "storage_accounts" {
  description = "Map of created storage accounts"
  value       = module.storage_account.storage_accounts
  sensitive   = true
}

output "virtual_networks" {
  description = "Map of created virtual networks"
  value       = module.azurerm_vnet.virtual_networks
}

output "subnets" {
  description = "Map of created subnets"
  value       = module.azurerm_subnet.subnets
}

output "network_security_groups" {
  description = "Map of created network security groups"
  value       = module.azurerm_subnet.network_security_groups
}
