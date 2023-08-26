variable "deploy" {
  description = "Whether to deploy or the access policies"
  type        = bool
  default     = false
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

variable "physical_domains" {
  description = "Physical Baremetal Domain"
  type = list(object({
    name         = string
    name_alias   = optional(string)
    annotation   = optional(string)
    description  = optional(string)
    vlan_pool_dn = optional(string)
  }))

  default = [{
    name         = ""
    name_alias   = ""
    annotation   = ""
    description  = ""
    vlan_pool_dn = ""
  }]
}

variable "vlan_pool_ids" {
  description = "Vlan Pool DN"
  type        = list(string)
  default     = []
}
