resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  project            = var.project
  location           = var.location
  network            = var.vpc_network_name
  subnetwork         = var.vpc_subnetwork_name



  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  
  private_cluster_config {
    enable_private_nodes   = true
    enable_private_endpoint = true
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
  }
  master_authorized_networks_config {
    cidr_blocks {
      display_name = "gke-master-authZ-Net"
      cidr_block   = var.gke_master_authZ-Net
    }
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster_secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name
  }
  depends_on = [
    google_compute_subnetwork.vpc-subnet,
  ]


}

resource "google_container_node_pool" "primary_nodes" {
  name       = var.primary-node-pool
  project    = var.project  
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = var.pri_node_count

  node_config {
    machine_type = var.node_machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.k8s-svc.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
  depends_on = [
    google_service_account.k8s-svc,
  ]

}

resource "google_container_node_pool" "secondary_preemptible_nodes" {
  name       = var.secondary-node-pool
  project    = var.project
  location   = var.location
  cluster    = google_container_cluster.primary.name
  initial_node_count = 0

  autoscaling {
    # Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count.
    min_node_count = var.autoscaling_min_node_count

    # Maximum number of nodes in the NodePool. Must be >= min_node_count.
    max_node_count = var.autoscaling_max_node_count
  }

  node_config {
    preemptible  = true
    machine_type = var.node_machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.k8s-svc.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
  depends_on = [
    google_service_account.k8s-svc,
  ]
}
