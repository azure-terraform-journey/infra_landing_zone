resource_groups = {
  rg_prod_app = {
    name     = "rg-prod-app-eastus-001"
    location = "eastus"
    tags = {
      Environment = "Prod"
      Owner       = "AppTeam"
      ManagedBy   = "Terraform"
    }
  }
  rg_prod_data = {
    name     = "rg-prod-data-eastus-001"
    location = "eastus"
    tags = {
      Environment = "Prod"
      Owner       = "DataTeam"
      ManagedBy   = "Terraform"
    }
  }
}

storage_accounts = {
  stprodapp001 = {
    name                     = "stproappeastus001"
    resource_group_name      = "rg-prod-app-eastus-001"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Environment = "Prod"
      Component   = "AppStorage"
      ManagedBy   = "Terraform"
    }
  }
  stproddata001 = {
    name                     = "stproddataeastus001"
    resource_group_name      = "rg-prod-data-eastus-001"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      Environment = "Prod"
      Component   = "DataStorage"
      ManagedBy   = "Terraform"
    }
  }
}
