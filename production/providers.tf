terraform {
  required_providers {
    dns = {
      source = "hashicorp/dns"
      version = "3.3.2"
    }
  }
}

provider "dns" {
 update {
  server 		= env.server
  key_name		= env.key_name
  key_algorithm = env.key_algorithm
  key_secret = env.key_secret
 }
}
