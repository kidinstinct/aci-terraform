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

variable "vlan_ranges" {
  description = "Vlan Ranges"
  type = list(object({
    from       = string
    to         = string
    range_role = string
    alloc_mode = string
  }))
}

variable "vlan_pool_ids" {
  description = "Vlan Pool DN"
  type        = list(string)
  default     = []
}

