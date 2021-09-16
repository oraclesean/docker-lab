resource oci_core_internet_gateway lab_ig {
  display_name               = "${var.lab_name}-internet-gateway"
  compartment_id             = oci_identity_compartment.lab_compartment.id
  vcn_id                     = oci_core_vcn.lab_vcn.id
  enabled                    = "true"
#  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
}
