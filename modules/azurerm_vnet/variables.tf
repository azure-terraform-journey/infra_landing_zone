variable "vnets" {
  description = "Map of virtual network objects to create"
  type = map(object({
    vnet_name     = string
    rg_name       = string
    location      = string
    address_space = list(string)
    tags          = optional(map(string), {})
  }))
}
