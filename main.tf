resource "google_dns_managed_zone" "dns_managed_zones" {
  for_each = var.dns_managed_zones

  dns_name        = each.value.dns_name
  name            = each.value.name
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  force_destroy   = each.value.force_destroy
  labels          = each.value.labels
  project         = each.value.project
  visibility      = each.value.visibility

  dynamic "cloud_logging_config" {
    for_each = each.value.cloud_logging_config != null ? [each.value.cloud_logging_config] : []
    content {
      enable_logging = cloud_logging_config.value.enable_logging
    }
  }

  dynamic "dnssec_config" {
    for_each = each.value.dnssec_config != null ? [each.value.dnssec_config] : []
    content {
      dynamic "default_key_specs" {
        for_each = dnssec_config.value.default_key_specs != null ? dnssec_config.value.default_key_specs : []
        content {
          algorithm  = default_key_specs.value.algorithm
          key_length = default_key_specs.value.key_length
          key_type   = default_key_specs.value.key_type
          kind       = default_key_specs.value.kind
        }
      }
      kind          = dnssec_config.value.kind
      non_existence = dnssec_config.value.non_existence
      state         = dnssec_config.value.state
    }
  }

  dynamic "forwarding_config" {
    for_each = each.value.forwarding_config != null ? [each.value.forwarding_config] : []
    content {
      dynamic "target_name_servers" {
        for_each = forwarding_config.value.target_name_servers
        content {
          domain_name     = target_name_servers.value.domain_name
          forwarding_path = target_name_servers.value.forwarding_path
          ipv4_address    = target_name_servers.value.ipv4_address
          ipv6_address    = target_name_servers.value.ipv6_address
        }
      }
    }
  }

  dynamic "peering_config" {
    for_each = each.value.peering_config != null ? [each.value.peering_config] : []
    content {
      target_network {
        network_url = peering_config.value.target_network.network_url
      }
    }
  }

  dynamic "private_visibility_config" {
    for_each = each.value.private_visibility_config != null ? [each.value.private_visibility_config] : []
    content {
      dynamic "gke_clusters" {
        for_each = private_visibility_config.value.gke_clusters != null ? private_visibility_config.value.gke_clusters : []
        content {
          gke_cluster_name = gke_clusters.value.gke_cluster_name
        }
      }
      dynamic "networks" {
        for_each = private_visibility_config.value.networks != null ? private_visibility_config.value.networks : []
        content {
          network_url = networks.value.network_url
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

