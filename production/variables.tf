variable "keyname" {
  description = "Name of the rndc key"
  type = string
  sensitive = true
}
variable "keysecret" {
  description = "Name of the rndc secret"
  type = string
  sensitive = true
}
variable "keyalgorithm" {
  description = "Name of the rndc algorithm"
  type = string
  sensitive = true
}
variable "server" {
  description = "Name of the server"
  type = string
  sensitive = true
}
