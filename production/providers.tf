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
    key_name      = "jenkins-key."
    key_algorithm = "hmac-sha256"
    key_secret    = "Yfr4AfgMgfDS1BUf4dpbua2hSea99spQVnnbvAJfL5g="
  }
}
