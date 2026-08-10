output "storage_accounts" {
  description = "Map of created storage account details"
  value       = azurerm_storage_account.sa
  sensitive   = true
}
