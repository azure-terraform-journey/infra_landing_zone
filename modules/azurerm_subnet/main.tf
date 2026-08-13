resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.subnet_prefix
}

resource "azurerm_network_security_group" "nsg" {
  for_each            = { for k, v in var.subnets : k => v if v.network_security_group_id == null }
  name                = coalesce(each.value.nsg_name, "nsg-${each.value.subnet_name}")
  location            = each.value.location
  resource_group_name = each.value.rg_name
  tags                = coalesce(each.value.tags, {})
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  for_each                  = var.subnets
  subnet_id                 = azurerm_subnet.subnets[each.key].id
  network_security_group_id = each.value.network_security_group_id != null ? each.value.network_security_group_id : azurerm_network_security_group.nsg[each.key].id
}
