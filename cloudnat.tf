resource "google_compute_router" "router" {
  name    = var.router_name
  project = var.project
  region  = var.region
  network = var.vpc_network_name

  bgp {
    asn = var.asn_num
  }
  depends_on = [
    google_compute_subnetwork.vpc-subnet,
  ]

}

resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = var.router_name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
  depends_on = [
    google_compute_router.router,
  ]

}
