output "virtual_hub_route_table_routes" {
  description = "All virtual_hub_route_table_route resources"
  value       = azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes
}
output "virtual_hub_route_table_routes_destinations" {
  description = "List of destinations values across all virtual_hub_route_table_routes"
  value       = [for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : v.destinations]
}
output "virtual_hub_route_table_routes_destinations_type" {
  description = "List of destinations_type values across all virtual_hub_route_table_routes"
  value       = [for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : v.destinations_type]
}
output "virtual_hub_route_table_routes_name" {
  description = "List of name values across all virtual_hub_route_table_routes"
  value       = [for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : v.name]
}
output "virtual_hub_route_table_routes_next_hop" {
  description = "List of next_hop values across all virtual_hub_route_table_routes"
  value       = [for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : v.next_hop]
}
output "virtual_hub_route_table_routes_next_hop_type" {
  description = "List of next_hop_type values across all virtual_hub_route_table_routes"
  value       = [for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : v.next_hop_type]
}
output "virtual_hub_route_table_routes_route_table_id" {
  description = "List of route_table_id values across all virtual_hub_route_table_routes"
  value       = [for k, v in azurerm_virtual_hub_route_table_route.virtual_hub_route_table_routes : v.route_table_id]
}

