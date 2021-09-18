resource "oci_identity_compartment" "lab_compartment" {
  name                       = "${var.lab_name}-compartment"
  description                = "Compartment for ${var.lab_name} resources"
  compartment_id             = var.tenancy_ocid
#  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
}

#resource "time_sleep" "wait60s" {
#  depends_on                 = [ oci_identity_compartment.lab_compartment ]
#  create_duration            = "60s"
#}

#resource "random_string" "database_password" {
#  depends_on                 = [ oci_identity_compartment.lab_compartment ]
#  length                     = 16
#  special                    = true
#  min_upper                  = 3
#  min_lower                  = 3
#  min_numeric                = 3
#  min_special                = 3
#  override_special           = "{}#^*<>[]%~"
#}
