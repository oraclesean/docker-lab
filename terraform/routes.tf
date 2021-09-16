resource oci_core_route_table lab_internet_route {
  display_name               = "${var.lab_name}-rt-ig"
  compartment_id             = oci_identity_compartment.lab_compartment.id
  vcn_id                     = oci_core_vcn.lab_vcn.id
  route_rules {
    description                = "${var.lab_name}-rt-ig-rules"
    destination                = "0.0.0.0/0"
    destination_type           = "CIDR_BLOCK"
    network_entity_id          = oci_core_internet_gateway.lab_ig.id
  }
#  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
}

resource oci_core_default_route_table lab_vcn_rt {
  display_name               = "${var.lab_name}-rt-vcn"
  compartment_id             = oci_identity_compartment.lab_compartment.id
  manage_default_resource_id = oci_core_vcn.lab_vcn.default_route_table_id
#  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
}
