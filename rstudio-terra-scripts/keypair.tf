resource "tls_private_key" "rsa_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "terra-key" {
  content  = tls_private_key.rsa_private_key.private_key_pem
  filename = "terrakey"
}
