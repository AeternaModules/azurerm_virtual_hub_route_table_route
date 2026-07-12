output "virtual_hub_route_table_routes_id" {
  description = "Map of id values across all virtual_hub_route_table_routes, keyed the same as var.virtual_hub_route_table_routes"
  value       = { for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : k => v.id }
}
output "virtual_hub_route_table_routes_destinations" {
  description = "Map of destinations values across all virtual_hub_route_table_routes, keyed the same as var.virtual_hub_route_table_routes"
  value       = { for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : k => v.destinations }
}
output "virtual_hub_route_table_routes_destinations_type" {
  description = "Map of destinations_type values across all virtual_hub_route_table_routes, keyed the same as var.virtual_hub_route_table_routes"
  value       = { for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : k => v.destinations_type }
}
output "virtual_hub_route_table_routes_name" {
  description = "Map of name values across all virtual_hub_route_table_routes, keyed the same as var.virtual_hub_route_table_routes"
  value       = { for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : k => v.name }
}
output "virtual_hub_route_table_routes_next_hop" {
  description = "Map of next_hop values across all virtual_hub_route_table_routes, keyed the same as var.virtual_hub_route_table_routes"
  value       = { for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : k => v.next_hop }
}
output "virtual_hub_route_table_routes_next_hop_type" {
  description = "Map of next_hop_type values across all virtual_hub_route_table_routes, keyed the same as var.virtual_hub_route_table_routes"
  value       = { for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : k => v.next_hop_type }
}
output "virtual_hub_route_table_routes_route_table_id" {
  description = "Map of route_table_id values across all virtual_hub_route_table_routes, keyed the same as var.virtual_hub_route_table_routes"
  value       = { for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : k => v.route_table_id }
}

