variable "configure_fabric" {
  description = "Wheter to deploy the module or not"
  type        = bool
  default     = true
}

variable "deploy_access_policies" {
  description = "Wheter to deploy the module or not"
  type        = bool
  default     = false
}

variable "apic_username" {
  description = "Username for APIC"
  type        = string
  default     = "admin"
}

variable "apic_password" {
  description = "Password for APIC"
  type        = string
  default     = "cisco123"
}

variable "apic_url" {
  description = "URL for APIC"
  type        = string
  default     = "https://sandboxapicdc.cisco.com"
}

variable "cert_name" {
  description = "Certificate name"
  type        = string
  default     = "sandboxapicdc.cisco.com"
}

variable "cert_private_key" {
  description = "Certificate private key"
  type        = string
  default     = "sandboxapicdc.cisco.com.key"
}

variable "is_insecure" {
  description = "Insecure flag"
  type        = bool
  default     = true
}

variable "env" {
  description = "Environment"
  type        = string
  default     = "dev"
}
