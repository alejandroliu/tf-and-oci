provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_record" "ubuntu-vm1" {
    zone_id = var.cloudflare_zone_id
    name = "ubuntu-vm1"
    value = oci_core_instance.ubuntu-vm1.public_ip
    type = "A"
    ttl = 500
    proxied = false
}
