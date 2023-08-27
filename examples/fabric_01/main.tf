module "fabric_setup" {
  source               = "../../modules/fabric_setup"
  providers            = { aci = aci.aci_cert }
  deploy               = true
  fabric_nodes         = local.fabric_nodes
  fabric_wide_settings = local.fabric_wide_settings
  bgp_as_info          = local.bgp_as_info
  bgp_rrs              = local.bgp_rrs
  env                  = var.env
}

module "vlan_pools" {
  source    = "../../modules/vlan_pools"
  providers = { aci = aci.aci_cert }
  deploy    = true
  env       = var.env

  for_each  = local.vlan_pools
  vlan_pool = each.value

  # leaf_profile_name = "leaf_101_102_baremetal"
}

module "vlan_ranges" {
  source    = "../../modules/vlan_ranges"
  providers = { aci = aci.aci_cert }
  deploy    = true

  for_each     = local.vlan_ranges
  vlan_range   = each.value
  vlan_pool_id = module.vlan_pools[each.key].vlan_pool_id[0]
}

module "phys_domains" {
  source    = "../../modules/phys_domain"
  providers = { aci = aci.aci_cert }
  deploy    = true

  for_each      = local.domains
  domains       = each.value
  vlan_pool_ids = module.vlan_pools[each.key].vlan_pool_id
}
#
module "aeeps" {
  source    = "../../modules/aeep"
  providers = { aci = aci.aci_cert }
  deploy    = true

  for_each = local.aeeps
  aeep     = each.value
  domain   = module.phys_domains[each.key].domain_ids[0]
}

