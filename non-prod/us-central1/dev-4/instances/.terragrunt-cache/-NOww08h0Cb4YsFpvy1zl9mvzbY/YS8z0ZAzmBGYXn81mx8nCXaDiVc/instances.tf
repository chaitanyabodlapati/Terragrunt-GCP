terraform {
  required_providers {
    google = {
      source = "hashicorp/google"

    }
  }
}

#  provider "google" {
#   #credentials = file("/Users/chaitu/terraform-335119-ff0422db5f67.json")
#   credentials = file("/Users/chaitu/gcp-migration-334418-1496f4dcabbe.json")
  

#   project = "gcp-migration-334418"
#   region  = "us-central1"
#   zone    = "us-central1-c"
#  }

resource "google_compute_network" "vpc_network" {
   name = "terraform-network"
 }

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags         = ["web", "dev"]


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }

  }
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }

}


