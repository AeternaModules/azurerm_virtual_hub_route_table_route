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
    next_hop_type     = optional(string) # Default: "ResourceId"
  }))
  validation {
    condition = alltrue([
      for k, v in var.virtual_hub_route_table_routes : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_hub_route_table_routes : (
        length(v.destinations) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_hub_route_table_routes : (
        contains(["CIDR", "ResourceId", "Service"], v.destinations_type)
      )
    ])
    error_message = "must be one of: CIDR, ResourceId, Service"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_hub_route_table_routes : (
        v.next_hop_type == null || (contains(["ResourceId"], v.next_hop_type))
      )
    ])
    error_message = "must be one of: ResourceId"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_virtual_hub_route_table_route's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: route_table_id
  #   source:    [from virtualwans.ValidateHubRouteTableID] !ok
  # path: route_table_id
  #   source:    [from virtualwans.ValidateHubRouteTableID] err != nil
  # path: next_hop
  #   source:    [from azure.ValidateResourceID] !ok
  # path: next_hop
  #   source:    [from azure.ValidateResourceID] err != nil
}

