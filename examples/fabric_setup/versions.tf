# require cisco aci provider
terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
    }
  }
}

provider "aci" {
  alias       = "aci_cert"
  username    = var.apic_username
  cert_name   = var.cert_name
  private_key = file(var.cert_private_key)
  url         = var.apic_url
  insecure    = var.is_insecure
}

provider "aci" {
  alias    = "aci_passwd"
  username = var.apic_username
  password = var.apic_password
  url      = var.apic_url
  insecure = var.is_insecure
}
