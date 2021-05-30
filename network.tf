// This file creates a custom VPC network and subnet to contain the
// GKE cluster.

resource "google_compute_network" "vpc-network" {
  name                    = var.vpc_network_name
  project                 = var.project
  auto_create_subnetworks = false
}

// Subnetwork for the GKE cluster.
resource "google_compute_subnetwork" "vpc-subnet" {
  name          = var.vpc_subnetwork_name
  project       = var.project
  ip_cidr_range = var.vpc_subnetwork_cidr_range
  network       = var.vpc_network_name
  region        = var.region

  // A secondary range is for a private cluster
  secondary_ip_range {
    range_name    = var.cluster_secondary_range_name
    ip_cidr_range = var.cluster_secondary_range_cidr
  }
  secondary_ip_range {
    range_name    = var.services_secondary_range_name
    ip_cidr_range = var.services_secondary_range_cidr
  }
  depends_on = [
    google_compute_network.vpc-network,
  ]
}
