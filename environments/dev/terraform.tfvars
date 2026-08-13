# Dev Environment Variables Configuration

resource_groups = {
  rg_dev_app = {
    name     = "rg-dev-app-eastus-001"
    location = "eastus"
    tags = {
      Environment = "Dev"
      Owner       = "AppTeam"
      ManagedBy   = "Terraform"
      CostCenter  = "CC-101-DEV"
    }
  }
  rg_dev_data = {
    name     = "rg-dev-data-eastus-001"
    location = "eastus"
    tags = {
      Environment = "Dev"
      Owner       = "DataTeam"
      ManagedBy   = "Terraform"
      CostCenter  = "CC-102-DEV"
    }
  }
  rg_dev_app2 = {
    name     = "rg-dev-app2-eastus-002"
    location = "eastus"
    tags = {
      Environment = "Dev2"
      Owner       = "AppTeam"
      ManagedBy   = "Terraform"
      CostCenter  = "CC-101-DEV"
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
      CostCenter  = "CC-101-DEV"
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
      CostCenter  = "CC-102-DEV"
    }
  }
}

vnets = {
  vnet_dev_001 = {
    vnet_name     = "vnet-dev-eastus-001"
    rg_name       = "rg-dev-app-eastus-001"
    location      = "eastus"
    address_space = ["10.0.0.0/16"]
    tags = {
      Environment = "Dev"
      ManagedBy   = "Terraform"
      CostCenter  = "CC-101-DEV"
    }
  }
}

subnets = {
  subnet1 = {
    subnet_name   = "snet-dev-app-001"
    rg_name       = "rg-dev-app-eastus-001"
    vnet_name     = "vnet-dev-eastus-001"
    subnet_prefix = ["10.0.1.0/24"]
    location      = "eastus"
    nsg_name      = "nsg-snet-dev-app-001"
    tags = {
      Environment = "Dev"
      ManagedBy   = "Terraform"
      CostCenter  = "CC-101-DEV"
    }
  }
}
