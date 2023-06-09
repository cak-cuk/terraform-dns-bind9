terraform {
  required_providers {
    dns = {
      source  = "hashicorp/dns"
      version = "3.3.2"
    }
  }
}

provider "dns" {
  update {
    server        = "10.85.202.120"
    key_name      = var.keyname
    key_algorithm = "hmac-sha256"
    key_secret    = var.keysecret
  }
}
