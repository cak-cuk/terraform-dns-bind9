terraform {
  required_providers {
    dns = {
      source  = "hashicorp/dns"
      version = "3.3.2"
    }
  }
  cloud {
    organization = "mahyuddin"
    workspaces {
      name = "jenkins-dns-lab"
    }
  }
}

provider "dns" {
  update {
    server        = "10.85.202.120"
    key_name      = "dnslab01."
    key_algorithm = "hmac-sha256"
    key_secret    = "dHAy/Xx+ML4PVhefW0Kfvh6osoA8/+KclCKaz5lYYBk="
  }
}
