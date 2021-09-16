resource oci_core_vcn lab_vcn {
  display_name               = "${var.lab_name}-vcn"
  compartment_id             = oci_identity_compartment.lab_compartment.id
  cidr_blocks                = [ "10.0.0.0/16" ]
  dns_label                  = replace(var.lab_name, "-", "")
#  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
}
