resource oci_core_instance lab_compute {
  display_name               = "${var.lab_name}-compute"
  compartment_id             = oci_identity_compartment.lab_compartment.id
  availability_domain        = local.availability_domain
  shape                      = var.instance_shape
  metadata                   = {
    ssh_authorized_keys        = var.ssh_public_key
    user_data                  = base64encode(data.template_file.cloud_config.rendered)
  }
  agent_config {
    is_management_disabled     = "false"
    is_monitoring_disabled     = "false"
  }
  create_vnic_details {
    subnet_id                  = oci_core_subnet.lab_subnet_pub.id
    display_name               = "${var.lab_name}-compute-vnic"
    assign_public_ip           = "true"
    private_ip                 = "10.0.0.3"
    skip_source_dest_check     = "false"
#    defined_tags               = var.defined_tags
    freeform_tags              = var.freeform_tags
  }

  source_details {
    source_id                  = data.oci_core_images.image_list.images.0.id
#    source_id                  = oci_core_image.docker_lab_image.id
    source_type                = "image"
  }

#  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
}
