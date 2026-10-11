variable "core_compute_clusters_lookup" {
  description = <<EOT
Map of core_compute_clusters_lookup, attributes below
Required:
    - compartment_id
Optional:
    - availability_domain
    - display_name
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    compartment_id      = string
    availability_domain = optional(string)
    display_name        = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

