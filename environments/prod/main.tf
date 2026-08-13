module "resource_group" {
  source          = "../../modules/resource_group"
  resource_groups = var.resource_groups
}

module "storage_account" {
  source           = "../../modules/storage_account"
  storage_accounts = var.storage_accounts

  depends_on = [module.resource_group]
}

module "azurerm_vnet" {
  source = "../../modules/azurerm_vnet"
  vnets  = var.vnets

  depends_on = [module.resource_group]
}

module "azurerm_subnet" {
  source  = "../../modules/azurerm_subnet"
  subnets = var.subnets

  depends_on = [
    module.resource_group,
    module.azurerm_vnet
  ]
}
