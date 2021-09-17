provider "oci" {
  tenancy_ocid               = var.tenancy_ocid
  region                     = var.region
### BEGIN UNCOMMENT FOR TERRAFORM CLI (running locally)
#  user_ocid                  = var.user_ocid
#  fingerprint                = var.fingerprint
#  private_key_path           = var.private_key_path
### END UNCOMMENT FOR TERRAFORM CLI (running locally)
### BEGIN UNCOMMENT FOR OCI CLOUD SHELL
#  auth                       = "InstancePrincipal"
### END UNCOMMENT FOR OCI CLOUD SHELL
}
