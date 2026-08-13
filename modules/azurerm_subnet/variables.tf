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
}
