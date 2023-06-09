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
  server 		= $TF_VAR_server
  key_name		= $TF_VAR_key_name
  key_algorithm = $TF_VAR_key_algorithm
  key_secret = $TF_VAR_key_secret
 }
}
