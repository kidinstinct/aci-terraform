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

module "baremetal_vlan_pools" {
  source     = "../../modules/vlan_pools"
  providers  = { aci = aci.aci_cert }
  deploy     = true
  vlan_pools = local.vlan_pools["baremetal"]
  env        = var.env

  # leaf_profile_name = "leaf_101_102_baremetal"
}

module "baremetal_vlan_ranges" {
  source        = "../../modules/vlan_ranges"
  providers     = { aci = aci.aci_cert }
  deploy        = true
  vlan_ranges   = local.vlan_ranges["baremetal"]
  vlan_pool_ids = module.baremetal_vlan_pools.vlan_pool_ids
}

module "phys_domains" {
  source           = "../../modules/phys_domain"
  providers        = { aci = aci.aci_cert }
  deploy           = true
  physical_domains = local.physical_domains
  vlan_pool_ids    = module.baremetal_vlan_pools.vlan_pool_ids
}

module "phys_aeep" {
  source    = "../../modules/aeep"
  providers = { aci = aci.aci_cert }
  deploy    = true
  aeep      = local.aeeps["baremetal"]
  domain    = module.phys_domains.domain_ids[0]
}

