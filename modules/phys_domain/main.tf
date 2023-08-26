terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
      version = "2.10.1"
    }
  }
}

# create physical domain
resource "aci_physical_domain" "this" {
  for_each                  = var.deploy ? { for k, v in var.physical_domains : k => v } : {}
  name                      = each.value.name
  name_alias                = each.value.name_alias
  annotation                = each.value.annotation
  relation_infra_rs_vlan_ns = element([for v in var.vlan_pool_ids : v], each.key)
}

output "domain_ids" {
  value = [for v in aci_physical_domain.this : v.id]
}
