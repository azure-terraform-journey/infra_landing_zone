resource_groups = {
  rg_dev_app = {
    name     = "rg-dev-app-eastus-001"
    location = "eastus"
    tags = {
      Environment = "Dev"
      Owner       = "AppTeam"
      ManagedBy   = "Terraform"
    }
  }
  rg_dev_data = {
    name     = "rg-dev-data-eastus-001"
    location = "eastus"
    tags = {
      Environment = "Dev"
      Owner       = "DataTeam"
      ManagedBy   = "Terraform"
    }
  }
}

storage_accounts = {
  stdevapp001 = {
    name                     = "stdevappeastus001"
    resource_group_name      = "rg-dev-app-eastus-001"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Environment = "Dev"
      Component   = "AppStorage"
      ManagedBy   = "Terraform"
    }
  }
  stdevdata001 = {
    name                     = "stdevdataeastus001"
    resource_group_name      = "rg-dev-data-eastus-001"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      Environment = "Dev"
      Component   = "DataStorage"
      ManagedBy   = "Terraform"
    }
  }
}
