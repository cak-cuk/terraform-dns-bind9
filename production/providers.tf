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
  key_name		= env_rndc_key_name
  key_algorithm = "hmac-md5"
  key_secret = env.rndc_key_secret
 } 
}
