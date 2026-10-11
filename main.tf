data "oci_core_compute_clusters" "core_compute_clusters_lookup" {
  for_each = var.core_compute_clusters_lookup

  compartment_id      = each.value.compartment_id
  availability_domain = each.value.availability_domain
  display_name        = each.value.display_name

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

