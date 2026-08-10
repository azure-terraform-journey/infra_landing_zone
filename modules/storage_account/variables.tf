variable "storage_accounts" {
  description = "Map of storage account objects to create"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = optional(string, "Standard")
    account_replication_type = optional(string, "LRS")
    tags                     = optional(map(string), {})
  }))
}
