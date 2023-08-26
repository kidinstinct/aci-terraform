terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
      version = ">= 2.10.1"
    }
  }
}

# create aaep
resource "aci_attachable_access_entity_profile" "this" {
  for_each    = var.deploy ? { for k, v in var.aeep : k => v } : {}
  name        = each.value.name
  name_alias  = each.value.name_alias
  annotation  = each.value.annotation
  description = each.value.description
}

output "aeep_ids" {
  value = [for v in aci_attachable_access_entity_profile.this : v.id]
}

locals {
  aeep = aci_attachable_access_entity_profile.this
}

# create aaep to physical domain
resource "aci_aaep_to_domain" "this" {
  for_each                            = length(local.aeep) > 0 ? { for k, v in local.aeep : k => v } : {}
  annotation                          = each.value.annotation
  attachable_access_entity_profile_dn = each.value.id
  domain_dn                           = var.domain
}
