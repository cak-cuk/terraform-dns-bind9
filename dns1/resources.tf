resource "dns_a_record_set" "www" {
  zone = "dns1.lab."
  name = "www"
  addresses = [
    "127.0.0.1",
    "127.0.0.53"
  ]
}
