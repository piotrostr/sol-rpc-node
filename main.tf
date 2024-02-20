resource "google_compute_instance" "vm_instance" {
  name         = "sol-node-vm"
  machine_type = "n2d-highmem-64" // (64 vCPU (AMD 32 core), 512 GB memory)
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
  attached_disk {
    mode   = "READ_WRITE"
    source = google_compute_disk.vm_disk.id
  }

  depends_on = [google_compute_disk.vm_disk, google_compute_address.static_ip]
}

resource "google_compute_disk" "vm_disk" {
  name = "sol-node-disk"
  type = "pd-ssd"
  size = 1000
  zone = "us-central1-a"
}

resource "google_compute_address" "static_ip" {
  name         = "sol-node-static-ip"
  address_type = "EXTERNAL"
  region       = "us-central1"
}
