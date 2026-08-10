# Prod Environment Variables Configuration

resource_groups = {
  rg_prod_app = {
    name     = "rg-prod-app-eastus-001"
    location = "eastus"
    tags = {
      Environment = "Prod"
      Owner       = "AppTeam"
      ManagedBy   = "Terraform"
      CostCenter  = "CC-101-PROD"
    }
  }
  rg_prod_data = {
    name     = "rg-prod-data-eastus-001"
    location = "eastus"
    tags = {
      Environment = "Prod"
      Owner       = "DataTeam"
      ManagedBy   = "Terraform"
      CostCenter  = "CC-102-PROD"
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
      CostCenter  = "CC-101-PROD"
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
      CostCenter  = "CC-102-PROD"
    }
  }
}
