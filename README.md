# 🌐 Azure Infrastructure Landing Zone 🚀

[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D%201.3.0-623CE4?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-azurerm%20~%3E%203.90-0089D6?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![Architecture](https://img.shields.io/badge/Architecture-Modular%20%26%20Multi--Env-00C853?style=for-the-badge)](https://github.com/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)

> ⚡ **Enterprise-Grade Azure Landing Zone** built with Terraform. Designed for scalable, multi-environment deployments (`Dev` & `Prod`) utilizing dynamic `for_each` module orchestration, remote state management, and strict tagging governance.

---

## 📋 Table of Contents

- [✨ Key Features](#-key-features)
- [📐 Architecture Overview](#-architecture-overview)
- [📁 Repository Structure](#-repository-structure)
- [🧩 Reusable Modules](#-reusable-modules)
- [🌍 Environments](#-environments)
- [⚙️ Prerequisites & Setup](#️-prerequisites--setup)
- [🚀 Quickstart & Deployment Guide](#-quickstart--deployment-guide)
  - [1. 🔑 Authenticate with Azure](#1--authenticate-with-azure)
  - [2. 🧪 Deploy Development Environment](#2--deploy-development-environment)
  - [3. 🏭 Deploy Production Environment](#3--deploy-production-environment)
- [🔧 Configuration Reference](#-configuration-reference)
- [🏷️ Tagging & Governance Strategy](#️-tagging--governance-strategy)
- [🛡️ Best Practices & Security](#️-best-practices--security)

---

## ✨ Key Features

- 🏗️ **Modular & Reusable Architecture**: Generic modules for Resource Groups and Storage Accounts decoupling implementation from variable inputs.
- ⚡ **Dynamic Resource Provisioning**: Clean HCL maps powered by `for_each` to create multiple resources with minimal boilerplate.
- 🔒 **Isolated Remote Backend**: Native Azure Storage Blob backend isolation per environment (`dev.tfstate` & `prod.tfstate`).
- 🏷️ **Automated Governance & Tagging**: Mandatory tagging schema across all resources for cost tracking, environment classification, and ownership.
- 🚦 **Multi-Environment Support**: Pre-configured `Dev` and `Prod` pipelines with environment-tailored parameters (e.g., `LRS` vs `GRS` storage replication).

---

## 📐 Architecture Overview

```text
                     +-----------------------------------+
                     | ☁️  Azure Cloud Subscription      |
                     +-----------------------------------+
                                       |
                   +-------------------+-------------------+
                   |                                       |
        +----------------------+                +----------------------+
        | 🧪 Dev Environment   |                | 🏭 Prod Environment  |
        | Key: dev.tfstate     |                | Key: prod.tfstate    |
        +----------------------+                +----------------------+
        | - rg-dev-app (East US)               | - rg-prod-app (East US)      |
        |   └── stdevapp001 (LRS)              |   └── stprodapp001 (GRS)     |
        | - rg-dev-data (East US)              | - rg-prod-data (East US)     |
        |   └── stdevdata001 (LRS)             |   └── stproddata001 (GRS)    |
        +----------------------+                +----------------------+
```

---

## 📁 Repository Structure

```tree
infra_landing_zone/
├── 🌍 environments/             # Multi-Environment Configurations
│   ├── 🧪 dev/                  # Development Environment
│   │   ├── main.tf              # Module calls for dev resources
│   │   ├── outputs.tf           # Exposed dev resource attributes
│   │   ├── providers.tf         # Azurerm provider & backend config
│   │   ├── terraform.tfvars     # Dev variable values
│   │   └── variables.tf         # Input variable declarations
│   └── 🏭 prod/                 # Production Environment
│       ├── main.tf              # Module calls for prod resources
│       ├── outputs.tf           # Exposed prod resource attributes
│       ├── providers.tf         # Azurerm provider & backend config
│       ├── terraform.tfvars     # Prod variable values
│       └── variables.tf         # Input variable declarations
└── 📦 modules/                  # Reusable Terraform Modules
    ├── 📁 resource_group/       # Resource Group Creation Module
    │   ├── main.tf              # Resource definitions (azurerm_resource_group)
    │   ├── outputs.tf           # Module outputs map
    │   └── variables.tf         # Expected input schema
    └── 📁 storage_account/      # Storage Account Creation Module
        ├── main.tf              # Resource definitions (azurerm_storage_account)
        ├── outputs.tf           # Module outputs map (Sensitive)
        └── variables.tf         # Expected input schema
```

---

## 🧩 Reusable Modules

| Module Name | Path | Description | Key Features |
| :--- | :--- | :--- | :--- |
| **Resource Group** | [modules/resource_group](file:///c:/terraform/infra_landing_zone/modules/resource_group) | Dynamically provisions Azure Resource Groups | `for_each` iteration, custom tags, multi-region support |
| **Storage Account** | [modules/storage_account](file:///c:/terraform/infra_landing_zone/modules/storage_account) | Dynamically provisions Azure Storage Accounts | Custom tiers (`Standard`/`Premium`), replication (`LRS`/`GRS`), RG binding |

---

## 🌍 Environments

### 🧪 1. Development (`dev`)
- 📌 **Path**: [environments/dev](file:///c:/terraform/infra_landing_zone/environments/dev)
- 💾 **State File**: `dev.tfstate`
- 🎯 **Target Tier**: Standard LRS (Cost-optimized)
- 📦 **Provisioned Resources**:
  - `rg-dev-app-eastus-001` ➔ Storage Account: `stdevappeastus001`
  - `rg-dev-data-eastus-001` ➔ Storage Account: `stdevdataeastus001`

### 🏭 2. Production (`prod`)
- 📌 **Path**: [environments/prod](file:///c:/terraform/infra_landing_zone/environments/prod)
- 💾 **State File**: `prod.tfstate`
- 🎯 **Target Tier**: Standard GRS (Geo-Redundant / High Availability)
- 📦 **Provisioned Resources**:
  - `rg-prod-app-eastus-001` ➔ Storage Account: `stproappeastus001`
  - `rg-prod-data-eastus-001` ➔ Storage Account: `stproddataeastus001`

---

## ⚙️ Prerequisites & Setup

Before deploying, ensure your local workspace has the following tools installed and configured:

> [!IMPORTANT]
> - 🛠️ **Terraform CLI**: `v1.3.0` or higher ([Download](https://developer.hashicorp.com/terraform/downloads))
> - ☁️ **Azure CLI (`az`)**: Installed and authenticated ([Download](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli))
> - 🔐 **Azure Remote Backend**: Existing Resource Group (`infra_rg`), Storage Account (`stgsan123`), and Blob Container (`containersan`).

---

## 🚀 Quickstart & Deployment Guide

### 1. 🔑 Authenticate with Azure

Open your terminal and log into your Azure account:

```bash
# Login to Azure
az login

# Set your active target subscription
az account set --subscription "<YOUR_AZURE_SUBSCRIPTION_ID>"
```

---

### 2. 🧪 Deploy Development Environment

```bash
# Navigate to the Dev environment directory
cd environments/dev

# 1. Initialize Terraform & Azure Remote Backend
terraform init

# 2. Preview planned changes
terraform plan

# 3. Apply infrastructure configurations
terraform apply -auto-approve
```

> [!TIP]
> To destroy the development environment resources when testing is finished:
> ```bash
> terraform destroy
> ```

---

### 3. 🏭 Deploy Production Environment

```bash
# Navigate to the Prod environment directory
cd environments/prod

# 1. Initialize Terraform & Azure Remote Backend
terraform init

# 2. Preview planned production changes
terraform plan

# 3. Apply infrastructure configurations
terraform apply
```

---

## 🔧 Configuration Reference

Resources are configured declaratively via `terraform.tfvars`. Here is a reference snippet:

```hcl
# 📦 Resource Group Map Configuration
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
}

# 💾 Storage Account Map Configuration
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
}
```

---

## 🏷️ Tagging & Governance Strategy

All resources strictly apply metadata tags to ensure enterprise compliance and simplified billing reports:

| Tag Key 🏷️ | Description 📝 | Dev Example 🧪 | Prod Example 🏭 |
| :--- | :--- | :--- | :--- |
| `Environment` | Infrastructure lifecycle phase | `Dev` | `Prod` |
| `Owner` | Responsible team/squad | `AppTeam` / `DataTeam` | `AppTeam` / `DataTeam` |
| `Component` | Architectural function | `AppStorage` / `DataStorage` | `AppStorage` / `DataStorage` |
| `CostCenter` | Financial tracking code | `CC-101-DEV` | `CC-101-PROD` |
| `ManagedBy` | Infrastructure management tool | `Terraform` | `Terraform` |

---

## 🛡️ Best Practices & Security

> [!NOTE]
> - 🔒 **State Protection**: Sensitive output keys for storage accounts are marked as `sensitive = true` in Terraform to prevent secret leakage in console outputs.
> - 🛡️ **Replication Rules**: Dev environment uses `LRS` to optimize cloud spend, while Production enforces `GRS` for geo-disaster resiliency.
> - 🧼 **Clean Code Standard**: Always run `terraform fmt -recursive` before committing updates.

---

<p align="center">
  <i>Made with ❤️ for Cloud Engineers & DevOps Teams</i>
</p>