module "resource_group" {
  source          = "../../modules/resource_group"
  resource_groups = var.resource_groups
}

module "storage_account" {
  source           = "../../modules/storage_account"
  storage_accounts = var.storage_accounts
}
