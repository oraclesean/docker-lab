resource oci_core_subnet lab_subnet_pub {
  display_name               = "${var.lab_name}-sn-public"
  compartment_id             = oci_identity_compartment.lab_compartment.id
  vcn_id                     = oci_core_vcn.lab_vcn.id
  cidr_block                 = "10.0.0.0/24"
  dhcp_options_id            = oci_core_vcn.lab_vcn.default_dhcp_options_id
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_route_table.lab_internet_route.id
  security_list_ids          = [ oci_core_security_list.lab_pub_subnet_sl.id ]
#  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
}

resource oci_core_subnet lab_subnet_prv {
  display_name               = "${var.lab_name}-sn-private"
  compartment_id             = oci_identity_compartment.lab_compartment.id
  vcn_id                     = oci_core_vcn.lab_vcn.id
  availability_domain        = local.availability_domain
  cidr_block                 = "10.0.1.0/24"
  dhcp_options_id            = oci_core_vcn.lab_vcn.default_dhcp_options_id
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_vcn.lab_vcn.default_route_table_id
  security_list_ids          = [ oci_core_security_list.lab_prv_subnet_sl.id ]
#  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
}
