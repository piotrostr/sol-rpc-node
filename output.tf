output "instance_public_ip" {
  description = "The public IP address of the Sol Node VM"
  value       = google_compute_address.static_ip.address
}

output "instance_name" {
  description = "The name of the Sol Node VM"
  value       = google_compute_instance.vm_instance.name
}
