output "comments" {
  value       = "Please wait approximately 15-20 minutes for download and installation of resources"
}

output "compute_public_ip" {
  value       = oci_core_instance.lab_compute.*.public_ip
}

output "generated_ssh_private_key" {
  value       = tls_private_key.public_private_key_pair.private_key_pem
}
