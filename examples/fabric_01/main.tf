module "fabric_setup" {
  count                = var.configure_fabric ? 1 : 0
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
  count       = var.deploy_access_policies ? 1 : 0
  source      = "../../modules/vlan_pools"
  providers   = { aci = aci.aci_cert }
  deploy      = true
  vlan_pools  = local.vlan_pools
  vlan_ranges = local.vlan_ranges
  env         = var.env

  # leaf_profile_name = "leaf_101_102_baremetal"
}

module "phys_domains" {
  count            = var.deploy_phys_domains ? 1 : 0
  source           = "../../modules/phys_domain"
  providers        = { aci = aci.aci_cert }
  deploy           = true
  physical_domains = local.physical_domains
  vlan_pool_ids    = module.vlan_pools[0].vlan_pool_ids
}
