terraform {
  required_providers {
    aci = {
      source  = "ciscodevnet/aci"
      version = ">=2.10.1"
    }
  }
}

# create vlan pool range
resource "aci_ranges" "this" {
  for_each     = var.deploy ? { for k, v in var.vlan_range : k => v } : {}
  vlan_pool_dn = var.vlan_pool_id
  from         = each.value.from
  to           = each.value.to
  alloc_mode   = each.value.alloc_mode
  role         = each.value.range_role
}

output "vlan_range_ids" {
  value = [for v in aci_ranges.this : v.id]
}
