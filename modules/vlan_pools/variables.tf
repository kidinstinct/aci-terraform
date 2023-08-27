variable "deploy" {
  description = "Whether to deploy or the access policies"
  type        = bool
  default     = false
}

variable "vlan_pool" {
  description = "Name"
  type = object({
    name        = string
    name_alias  = string
    annotation  = string
    description = string
    alloc_mode  = string
  })

  default = {
    alloc_mode  = "static"
    annotation  = "value"
    description = "value"
    name        = "value"
    name_alias  = "value"
  }
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}

