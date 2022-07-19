resource "google_compute_router" "router" {
  name    = "my-router"
  region  = google_compute_subnetwork.management-subnet.region
  network = google_compute_network.vpc_network.id
  bgp {
    asn = 64514
  }
}
