variable "deploy" {
  description = "Whether to deploy or the access policies"
  type        = bool
  default     = false
}

variable "aeep" {
  description = "Attachable Access Entity Profile"
  type = object({
    name        = string
    name_alias  = optional(string)
    annotation  = optional(string)
    description = optional(string)
  })

  default = {
    name        = ""
    name_alias  = ""
    annotation  = ""
    description = ""
  }
}

variable "domain" {
  description = "Domain to attache AEEP to"
  type        = string
  default     = ""
}
