terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
}

provider "google" {
  credentials = file(var.gcp_credentials_file)     # path to JSON key
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_compute_network" "vpc" {
  name                    = "tf-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "tf-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_instance" "vm_instance" {
  name         = "tf-vm-instance"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 20
    }
  }

  network_interface {
    network    = google_compute_network.vpc.id
    subnetwork = google_compute_subnetwork.subnet.id

    access_config {
      # Ephemeral external IP
    }
  }

  metadata = {
    ssh-keys = var.ssh_user != "" ? "${var.ssh_user}:${file(var.ssh_public_key_path)}" : ""
  }
  tags = ["http-server"]
}
