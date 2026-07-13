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
        alltrue([for x in v.destinations : length(x) > 0])
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
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

