resource "google_compute_instance" "vm_instance" {
  name         = "sol-node-vm"
  machine_type = "n2d-highmem-64" // (64 vCPU (AMD 32 core), 512 GB memory)
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size  = 50
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

  tags = ["sol-node-vm"]

  depends_on = [
    google_compute_disk.vm_disk,
    google_compute_address.static_ip,
    google_compute_firewall.solana_firewall,
  ]
}

resource "google_compute_disk" "vm_disk" {
  name = "sol-node-disk"
  type = "pd-ssd"
  size = 2000
  zone = "us-central1-a"
  lifecycle {
    prevent_destroy = true
  }
}

resource "google_compute_address" "static_ip" {
  name         = "sol-node-static-ip"
  address_type = "EXTERNAL"
  region       = "us-central1"
}

resource "google_compute_firewall" "solana_firewall" {
  name    = "allow-solana-ports"
  network = "default"
  allow {
    protocol = "tcp"
    ports    = ["8899", "8900", "8001"]
  }
  allow {
    protocol = "udp"
    ports    = ["8000-8020"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["sol-node-vm"]
}
