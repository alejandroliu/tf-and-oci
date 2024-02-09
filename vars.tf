#
# Secret variables
#
variable "cloudflare_api_token" {
  type        = string
  description = "API token with DNS:Edit permissions"
  sensitive   = true
}
variable "cloudflare_zone_id" {
  type        = string
  sensitive   = true
  description = "ID for Cloudflare zone (look-up in domain dashboard)"
}


variable "tenancy_ocid" {
  type        = string
  description = "ID of the tenant in OCI to use"
  sensitive   = true
}

variable "user_ocid" {
  type        = string
  description = "ID of the user in OCI to use"
}

variable "user_key_path" {
  type        = string
  description = "path to the file to containing private key"
}

variable "user_key_fingerprint" {
  type        = string
  description = "rsa key fingerprint or API user"
  sensitive   = true
}

variable "compartment_ocid" {
  type        = string
  description = "ID of the compartment in OCI to use"
  sensitive   = true
}

variable "region_name" {
  type        = string
  description = "Region to deploy resources"
}

# Get source_id from https://docs.oracle.com/en-us/iaas/images/
variable "img_ubuntu_2204_amd64" {
  type = string
}

variable "img_ubuntu_2204_arm64" {
  type = string
}

