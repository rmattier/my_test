provider "google" {
  credentials	= "${file("account.json")}"
  project	= "${var.project_name}"
  region	= "${var.region}"
  zone		= "${var.zone}"
}

resource "google_compute_instance" "vm_instance" {
  name		= "terraform-instance"
  machine_type	= "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network	= "default"
    access_config = {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name		= "terraform-network"
  auto_create_subnetworks	= "true"
}
