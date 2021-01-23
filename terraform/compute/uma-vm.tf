provider "google" {
  project     = "${var.project}"
  region      = "${var.location}"
  credentials = "${file("/tmp/.gcp/credentials.json")}"
}

terraform {
  required_version = "0.11.13"
}

resource "google_compute_instance" "uma_vm" {
  name         = "uma-vm"
  machine_type = "e2-standard-4"
  zone         = "${var.location}"

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }

  network_interface {
    network    = "vpc-uma-network"
    subnetwork = "uma-subnetwork"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    ssh-keys = "uma:${file(var.pub_key_path)}"
  }
}
