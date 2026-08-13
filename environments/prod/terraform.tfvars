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

vnets = {
  vnet_prod_001 = {
    vnet_name     = "vnet-prod-eastus-001"
    rg_name       = "rg-prod-app-eastus-001"
    location      = "eastus"
    address_space = ["10.1.0.0/16"]
    tags = {
      Environment = "Prod"
      ManagedBy   = "Terraform"
      CostCenter  = "CC-101-PROD"
    }
  }
}

subnets = {
  subnet1 = {
    subnet_name   = "snet-prod-app-001"
    rg_name       = "rg-prod-app-eastus-001"
    vnet_name     = "vnet-prod-eastus-001"
    subnet_prefix = ["10.1.1.0/24"]
    location      = "eastus"
    nsg_name      = "nsg-snet-prod-app-001"
    tags = {
      Environment = "Prod"
      ManagedBy   = "Terraform"
      CostCenter  = "CC-101-PROD"
    }
  }
}
