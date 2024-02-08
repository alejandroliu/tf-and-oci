# Get source_id from https://docs.oracle.com/en-us/iaas/images/


resource "oci_core_instance" "ubuntu-vm1" {
    # Required
    availability_domain = data.oci_identity_availability_domains.general_ads.availability_domains[0].name
    compartment_id = var.compartment_ocid

    #shape = "VM.Standard.A1.Flex"
    #shape_config {
    #    memory_in_gbs = 4
    #    ocpus = 2
    #}
    #source_details {
    #    source_id = var.img_ubuntu_2204_arm64
    #    source_type = "image"
    #}
    shape = "VM.Standard.E2.1.Micro"
    source_details {
        source_id = var.img_ubuntu_2204_amd64
        source_type = "image"
    }

    # Optional
    display_name = "ubuntu-vm1"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("default-id_key.pub")
        #user_data = "${base64encode(file("cloud-init.yml"))}"
        user_data = base64encode(templatefile("cloud-init.yml",{}))
    } 
    preserve_boot_volume = false
}
