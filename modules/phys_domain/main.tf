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
  count                     = var.deploy && length(var.domains) > 0 ? length(var.domains) : 0
  name                      = var.domains.name
  name_alias                = var.domains.name_alias
  annotation                = var.domains.annotation
  relation_infra_rs_vlan_ns = element([for v in var.vlan_pool_ids : v], count.index)
}

output "domain_ids" {
  value = [for v in aci_physical_domain.this : v.id]
}
