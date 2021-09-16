resource oci_core_security_list lab_pub_subnet_sl {
  display_name               = "${var.lab_name}-sn-public-sl"
  compartment_id             = oci_identity_compartment.lab_compartment.id
  vcn_id                     = oci_core_vcn.lab_vcn.id
  egress_security_rules {
    #description                = ""
    destination                = "0.0.0.0/0"
    destination_type           = "CIDR_BLOCK"
    protocol                   = "all"
    stateless                  = "false"
  }
  ingress_security_rules {
    #description                = ""
    protocol                   = "1"
    source                     = "0.0.0.0/0"
    source_type                = "CIDR_BLOCK"
    stateless                  = "false"
    icmp_options {
      code                       = "4"
      type                       = "3"
    }
  }
  ingress_security_rules {
    #description                = ""
    protocol                   = "1"
    source                     = "10.0.0.0/16"
    source_type                = "CIDR_BLOCK"
    stateless                  = "false"
    icmp_options {
      code                       = "-1"
      type                       = "3"
    }
  }
  ingress_security_rules {
    #description                = ""
    #icmp_options               = ""
    protocol                   = "6"
    source                     = "0.0.0.0/0"
    source_type                = "CIDR_BLOCK"
    stateless                  = "false"
    tcp_options {
      max                        = "22"
      min                        = "22"
    }
  }
#  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
}

resource oci_core_security_list lab_prv_subnet_sl {
  display_name               = "${var.lab_name}-sn-private-sl"
  compartment_id             = oci_identity_compartment.lab_compartment.id
  vcn_id                     = oci_core_vcn.lab_vcn.id
  egress_security_rules {
    #description                = ""
    destination                = "0.0.0.0/0"
    destination_type           = "CIDR_BLOCK"
    protocol                   = "all"
    stateless                  = "false"
  }
  ingress_security_rules {
    #description                = ""
    protocol                   = "1"
    source                     = "0.0.0.0/0"
    source_type                = "CIDR_BLOCK"
    stateless                  = "false"
    icmp_options {
      code                       = "4"
      type                       = "3"
    }
  }
  ingress_security_rules {
    #description                = ""
    protocol                   = "6"
    source                     = "10.0.0.0/16"
    source_type                = "CIDR_BLOCK"
    stateless                  = "false"
    tcp_options {
      max                        = "22"
      min                        = "22"
    }
  }
  ingress_security_rules {
    #description                = ""
    protocol                   = "1"
    source                     = "10.0.0.0/16"
    source_type                = "CIDR_BLOCK"
    stateless                  = "false"
    icmp_options {
      code                       = "-1"
      type                       = "3"
    }
  }
#  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
}

resource oci_core_default_security_list lab_vcn_sl {
  display_name               = "${var.lab_name}-vcn-sl"
  compartment_id             = oci_identity_compartment.lab_compartment.id
  manage_default_resource_id = oci_core_vcn.lab_vcn.default_security_list_id
#  defined_tags               = var.defined_tags
  freeform_tags              = var.freeform_tags
}
