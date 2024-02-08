
provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  region = var.region_name

  user_ocid = var.user_ocid
  fingerprint = var.user_key_fingerprint
  private_key_path = var.user_key_path
}

