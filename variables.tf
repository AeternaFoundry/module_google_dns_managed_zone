variable "dns_managed_zones" {
  description = <<EOT
Map of dns_managed_zones, attributes below
Required:
    - dns_name
    - name
Optional:
    - deletion_policy
    - description
    - force_destroy
    - labels
    - project
    - visibility
    - cloud_logging_config (block):
        - enable_logging (required)
    - dnssec_config (block):
        - default_key_specs (optional, block):
            - algorithm (optional)
            - key_length (optional)
            - key_type (optional)
            - kind (optional)
        - kind (optional)
        - non_existence (optional)
        - state (optional)
    - forwarding_config (block):
        - target_name_servers (required, block):
            - domain_name (optional)
            - forwarding_path (optional)
            - ipv4_address (optional)
            - ipv6_address (optional)
    - peering_config (block):
        - target_network (required, block):
            - network_url (required)
    - private_visibility_config (block):
        - gke_clusters (optional, block):
            - gke_cluster_name (required)
        - networks (optional, block):
            - network_url (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    dns_name        = string
    name            = string
    deletion_policy = optional(string)
    description     = optional(string)
    force_destroy   = optional(bool)
    labels          = optional(map(string))
    project         = optional(string)
    visibility      = optional(string)
    cloud_logging_config = optional(object({
      enable_logging = bool
    }))
    dnssec_config = optional(object({
      default_key_specs = optional(list(object({
        algorithm  = optional(string)
        key_length = optional(number)
        key_type   = optional(string)
        kind       = optional(string)
      })))
      kind          = optional(string)
      non_existence = optional(string)
      state         = optional(string)
    }))
    forwarding_config = optional(object({
      target_name_servers = list(object({
        domain_name     = optional(string)
        forwarding_path = optional(string)
        ipv4_address    = optional(string)
        ipv6_address    = optional(string)
      }))
    }))
    peering_config = optional(object({
      target_network = object({
        network_url = string
      })
    }))
    private_visibility_config = optional(object({
      gke_clusters = optional(list(object({
        gke_cluster_name = string
      })))
      networks = optional(list(object({
        network_url = string
      })))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.dns_managed_zones : (
        v.forwarding_config == null || (length(v.forwarding_config.target_name_servers) >= 1)
      )
    ])
    error_message = "Each target_name_servers list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.dns_managed_zones : (
        v.description == null || (length(v.description) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

