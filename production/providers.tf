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
  server 		= env.RNDC_KEY_SERVER
  key_name		= env.RNDC_KEY_NAME
  key_algorithm = env.RNDC_KEY_ALGORITHM
  key_secret = env.RNDC_KEY_SECRET
 }
}
