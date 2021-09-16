output "ocid" {
  description = "OCID of the instance."
  value       = oci_core_instance.lab_compute.*.id
}

output "dev" {
  value       = "Developed for Oracle on Docker Hands-on-Lab"
}

output "comments" {
  value       = "Please wait approximately 10-15 minutes for download and installation of resources"
}

output "compute_public_ip" {
  value       = oci_core_instance.lab_compute.*.public_ip
}
