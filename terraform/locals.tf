locals {
  availability_domain        = data.oci_identity_availability_domains.ad_list.availability_domains.0.nameic_key
  private_key                = try(file(var.private_key_path), var.private_key)
}
