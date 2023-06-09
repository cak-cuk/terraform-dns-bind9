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
  server 		= env.TF_VAR_server
  key_name		= env.TF_VAR_key_name
  key_algorithm = env.TF_VAR_key_algorithm
  key_secret = env.TF_VAR_key_secret
 }
}
