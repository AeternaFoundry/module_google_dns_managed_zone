output "dns_managed_zones_id" {
  description = "Map of id values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no id are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.id if v.id != null && length(v.id) > 0 }
}
output "dns_managed_zones_cloud_logging_config" {
  description = "Map of cloud_logging_config values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no cloud_logging_config are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => one(v.cloud_logging_config) if v.cloud_logging_config != null && length(v.cloud_logging_config) > 0 }
}
output "dns_managed_zones_creation_time" {
  description = "Map of creation_time values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no creation_time are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.creation_time if v.creation_time != null && length(v.creation_time) > 0 }
}
output "dns_managed_zones_deletion_policy" {
  description = "Map of deletion_policy values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no deletion_policy are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "dns_managed_zones_description" {
  description = "Map of description values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no description are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.description if v.description != null && length(v.description) > 0 }
}
output "dns_managed_zones_dns_name" {
  description = "Map of dns_name values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no dns_name are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.dns_name if v.dns_name != null && length(v.dns_name) > 0 }
}
output "dns_managed_zones_dnssec_config" {
  description = "Map of dnssec_config values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no dnssec_config are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => one(v.dnssec_config) if v.dnssec_config != null && length(v.dnssec_config) > 0 }
}
output "dns_managed_zones_effective_labels" {
  description = "Map of effective_labels values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no effective_labels are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "dns_managed_zones_force_destroy" {
  description = "Map of force_destroy values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no force_destroy are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.force_destroy if v.force_destroy != null }
}
output "dns_managed_zones_forwarding_config" {
  description = "Map of forwarding_config values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no forwarding_config are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => one(v.forwarding_config) if v.forwarding_config != null && length(v.forwarding_config) > 0 }
}
output "dns_managed_zones_labels" {
  description = "Map of labels values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no labels are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "dns_managed_zones_managed_zone_id" {
  description = "Map of managed_zone_id values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no managed_zone_id are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.managed_zone_id if v.managed_zone_id != null }
}
output "dns_managed_zones_name" {
  description = "Map of name values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no name are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.name if v.name != null && length(v.name) > 0 }
}
output "dns_managed_zones_name_servers" {
  description = "Map of name_servers values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no name_servers are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.name_servers if v.name_servers != null && length(v.name_servers) > 0 }
}
output "dns_managed_zones_peering_config" {
  description = "Map of peering_config values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no peering_config are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => one(v.peering_config) if v.peering_config != null && length(v.peering_config) > 0 }
}
output "dns_managed_zones_private_visibility_config" {
  description = "Map of private_visibility_config values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no private_visibility_config are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => one(v.private_visibility_config) if v.private_visibility_config != null && length(v.private_visibility_config) > 0 }
}
output "dns_managed_zones_project" {
  description = "Map of project values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no project are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.project if v.project != null && length(v.project) > 0 }
}
output "dns_managed_zones_terraform_labels" {
  description = "Map of terraform_labels values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no terraform_labels are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}
output "dns_managed_zones_visibility" {
  description = "Map of visibility values across all dns_managed_zones, keyed the same as var.dns_managed_zones except keys with no visibility are omitted"
  value       = { for k, v in google_dns_managed_zone.dns_managed_zones : k => v.visibility if v.visibility != null && length(v.visibility) > 0 }
}

