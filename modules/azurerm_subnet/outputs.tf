output "subnets" {
  description = "Map of created subnet details"
  value       = azurerm_subnet.subnets
}

output "network_security_groups" {
  description = "Map of created network security group details"
  value       = azurerm_network_security_group.nsg
}

output "subnet_nsg_associations" {
  description = "Map of subnet NSG associations"
  value       = azurerm_subnet_network_security_group_association.nsg_assoc
}
