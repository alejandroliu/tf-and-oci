module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  #~ version = "3.1.0"

  # Required Inputs
  compartment_id = var.compartment_ocid
  region = var.region_name

  internet_gateway_route_rules = null
  local_peering_gateways = null
  nat_gateway_route_rules = null

  # Optional Inputs
  vcn_name = "general"
  vcn_dns_label = "gpnet"
  vcn_cidrs = ["10.10.0.0/16"]
  
  create_internet_gateway = true
  create_nat_gateway = false
  create_service_gateway = false
}
