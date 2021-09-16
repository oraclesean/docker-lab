# Get tenancy details
data "oci_identity_tenancy" "tenant_details" {
  tenancy_id                 = var.tenancy_ocid
}

# List availability domains
data "oci_identity_availability_domains" "ad_list" {
  compartment_id             = oci_identity_compartment.lab_compartment.id
}

data "oci_core_images" "image_list" {
  compartment_id             = oci_identity_compartment.lab_compartment.id
  operating_system           = "Oracle Linux"
  operating_system_version   = "7.9"
  shape                      = var.instance_shape
  sort_by                    = "TIMECREATED"
}

data template_file "cloud_config" {
  template                   = file("${path.module}/templates/cloud_config.yaml")
  vars                       = {
    alpine_basename            = var.alpine_basename
    alpine_source              = var.alpine_source
    container_name             = var.container_name
    container_registry_link    = var.container_registry_link
    container_registry_pass    = var.container_registry_pass
    container_registry_user    = var.container_registry_user
    database_password          = random_string.database_password.result
    db_version                 = var.db_version
    dbsw_url                   = var.dbsw_url
    default_user               = var.default_user
    docker_group               = var.docker_group
    docker_repo_name           = var.docker_repo_name
    docker_repo_path           = var.docker_repo_path
    docker_repo_source         = var.docker_repo_source
    docker_tns_port            = var.docker_tns_port
    image_id                   = var.image_id
    image_source               = var.image_source
    image_url                  = var.image_url
    lab_repo_name              = var.lab_repo_name
    lab_repo_source            = var.lab_repo_source
    oracle_pdb                 = var.oracle_pdb
    oracle_sid                 = var.oracle_sid
    oracle_uid                 = var.oracle_uid
    oracle_user                = var.oracle_user
    oracle_gid                 = var.oracle_gid
    oracle_group               = var.oracle_group
    oradata_dir                = var.oradata_dir
    run_container              = var.run_container
  }
}
