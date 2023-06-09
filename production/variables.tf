variable "key_name" {
  description = "Name of the rndc key"
  type = string
  sensitive = true
}
variable "key_secret" {
  description = "Name of the rndc secret"
  type = string
  sensitive = true
}
variable "key_algorithm" {
  description = "Name of the rndc algorithm"
  type = string
  sensitive = true
}
