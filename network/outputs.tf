output "vpc_name" {
  value = google_compute_network.vpc_network.name
}

output "restricted_subnet_name" {
  value = google_compute_subnetwork.restricted-subnet.name
}

output "management_subnet_name" {
  value = google_compute_subnetwork.management-subnet.name
}

output "cluster_secondary_range_name" {
  value = google_compute_subnetwork.restricted-subnet.secondary_ip_range.0.range_name
}

output "service_secondary_range_name" {
  value = google_compute_subnetwork.restricted-subnet.secondary_ip_range.1.range_name
}

output "management_subnet_cidr" {
  value = google_compute_subnetwork.management-subnet.ip_cidr_range
}