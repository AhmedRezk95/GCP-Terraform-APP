resource "google_compute_subnetwork" "management-subnet" {
  name          = "management-subnet"
  ip_cidr_range = var.management-subnet-cidr
  region        = var.vpc_region
  network       = google_compute_network.vpc_network.name
}

resource "google_compute_subnetwork" "restricted-subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = var.restricted-subnet-cidr
  region        = var.vpc_region
  network       = google_compute_network.vpc_network.name

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = var.service_secondary_ip_cidr
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = var.pod_secondary_ip_cidr
  }

}