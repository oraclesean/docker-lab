# Terraform variables
variable "tenancy_ocid" {}
variable "region" {}
variable "compartment_ocid" {
  default = ""
}
variable "user_ocid" {
  default = ""
}
variable "fingerprint" {
  default = ""
}
variable "private_key" {
  default = ""
}
variable "private_key_path" {
  default = ""
}
variable "private_key_password" {
  default = ""
}
variable "ssh_public_key" {
  default = ""
}

# Infrastructure settings
variable "lab_name" {
  default = "docker-lab"
}
variable "instance_shape" {
  default = "VM.Standard.E2.1.Micro"
}
variable "image_source" {
  default = "Lab"
}

# Lab configuration variables
variable "alpine_source" {}
variable "alpine_basename" {}
variable "authorized_keys" {
  default = ""
}
variable "build_db_image" {
  type = bool
  default = false
}
variable "container_name" {
  default = "oradb"
}
variable "container_registry_link" {}
variable "container_registry_pass" {
  default = ""
}
variable "container_registry_user" {
  default = ""
}
variable "db_version" {
  default = "19.3.0"
}
variable "dbsw_url" {}
variable "default_user" {
  default = "opc"
}
variable "docker_group" {
  default = "docker"
}
variable "docker_repo_name" {
  default = "docker-images"
}
variable "docker_repo_path" {
  default = "OracleDatabase/SingleInstance/dockerfiles"
}
variable "docker_repo_source" {
  default = "https://github.com/oracle/docker-images"
}
variable "docker_tns_port" {
  type = number
  default = 11521
}
variable "download_labs" {
  type = bool
  default = true
}
variable "image_id" {}
variable "image_url" {}
variable "lab_repo_name" {
  default = "docker-lab"
}
variable lab_repo_source {
  default = "https://github.com/oraclesean/docker-lab"
}
variable "oracle_gid" {
  type = number
  default = 54321
}
variable "oracle_group" {
  default = "dba"
}
variable "oracle_pdb" {
  default = "ORCLPDB1"
}
variable "oracle_sid" {
  default = "ORCLCDB"
}
variable "oracle_uid" {
  type = number
  default = 54321
}
variable "oracle_user" {
  default = "oracle"
}
variable "oradata_dir" {
  default = "/oradata"
}
variable "run_container" {
  type = bool
  default = false
}

# Tag variables
variable "freeform_tags" {
  description                = "Default Freeform Tags"
  type                       = map(string)
  default                    = {
    module                     = "oracle-terraform-modules/vcn/oci"
    terraformed                = "yes"
  }
}
