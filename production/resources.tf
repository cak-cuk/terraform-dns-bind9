resource "dns_a_record_set" "www" {
  zone = "dns.lab"
  name = "www"
  address = [
  "127.0.0.1",
  "127.0.0.53"
 ]
}
