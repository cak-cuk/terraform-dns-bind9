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
  server 		= "10.85.202.120"
  key_name		= env.key_name
  key_algorithm = "hmac-md5"
  key_secret = env.key_secret
 }
}
