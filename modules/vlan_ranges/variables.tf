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

variable "vlan_range" {
  description = "Vlan Range"
  type = list(object({
    from       = string
    to         = string
    range_role = string
    alloc_mode = optional(string)
  }))
}

variable "vlan_pool_id" {
  description = "Vlan Pool DN"
  type        = string
  default     = ""
}

