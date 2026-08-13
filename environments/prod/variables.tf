variable "resource_groups" {
  description = "Map of resource group objects to create"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
}

variable "storage_accounts" {
  description = "Map of storage account objects to create"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = optional(string, "Standard")
    account_replication_type = optional(string, "GRS")
    tags                     = optional(map(string), {})
  }))
}

variable "vnets" {
  description = "Map of virtual network objects to create"
  type = map(object({
    vnet_name     = string
    rg_name       = string
    location      = string
    address_space = list(string)
    tags          = optional(map(string), {})
  }))
  default = {}
}

variable "subnets" {
  description = "Map of subnet objects to create with NSG associations"
  type = map(object({
    subnet_name               = string
    rg_name                   = string
    vnet_name                 = string
    subnet_prefix             = list(string)
    location                  = string
    network_security_group_id = optional(string)
    nsg_name                  = optional(string)
    tags                      = optional(map(string), {})
  }))
  default = {}
}
