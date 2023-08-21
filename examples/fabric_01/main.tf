module "fabric_setup" {
  count                = var.configure_fabric ? 1 : 0
  source               = "../../modules/fabric_setup"
  providers            = { aci = aci.aci_cert }
  deploy               = true
  fabric_nodes         = local.fabric_nodes
  fabric_wide_settings = local.fabric_wide_settings
  bgp_as_info          = local.bgp_as_info
  bgp_rrs              = local.bgp_rrs
}

module "access_policies" {
  count       = var.deploy_access_policies ? 1 : 0
  source      = "../../modules/access_policies"
  providers   = { aci = aci.aci_cert }
  deploy      = true
  vlan_pools  = local.access_policies.vlan_pools
  vlan_ranges = local.access_policies.vlan_ranges

  # environment = var.environment
  # leaf_profile_name = "leaf_101_102_baremetal"
}
