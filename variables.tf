variable "virtual_hub_route_table_routes" {
  description = <<EOT
Map of virtual_hub_route_table_routes, attributes below
Required:
    - destinations
    - destinations_type
    - name
    - next_hop
    - route_table_id
Optional:
    - next_hop_type
EOT

  type = map(object({
    destinations      = set(string)
    destinations_type = string
    name              = string
    next_hop          = string
    route_table_id    = string
    next_hop_type     = optional(string)
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_virtual_hub_route_table_route's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: route_table_id
  #   source:    [from virtualwans.ValidateHubRouteTableID] !ok
  # path: route_table_id
  #   source:    [from virtualwans.ValidateHubRouteTableID] err != nil
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: destinations[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: destinations_type
  #   condition: contains(["CIDR", "ResourceId", "Service"], value)
  #   message:   must be one of: CIDR, ResourceId, Service
  # path: next_hop
  #   source:    [from azure.ValidateResourceID] !ok
  # path: next_hop
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: next_hop_type
  #   condition: contains(["ResourceId"], value)
  #   message:   must be one of: ResourceId
}

