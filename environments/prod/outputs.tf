output "resource_groups" {
  description = "Map of created resource groups"
  value       = module.resource_group.resource_groups
}

output "storage_accounts" {
  description = "Map of created storage accounts"
  value       = module.storage_account.storage_accounts
  sensitive   = true
}
