
resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "us-east1-b"

  # define vpc
  network = google_compute_network.vpc_network.name

  # set the restricted subnet to the cluster
  subnetwork = google_compute_subnetwork.restricted-subnet.name

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  # Set networking_mode requires the ip_allocation_policy block to be defined.
  # by default if it is not set, GKE will create a ROUTES-based cluster. 
  networking_mode = "VPC_NATIVE"


  ip_allocation_policy {
    # ip ranges for pods
    cluster_secondary_range_name = google_compute_subnetwork.restricted-subnet.secondary_ip_range.0.range_name
    # ip ranges for services
    services_secondary_range_name = google_compute_subnetwork.restricted-subnet.secondary_ip_range.1.range_name
  }

  # the following block regarding upgrading the cluster 
  # provide more control over automatic upgrades of your GKE clusters.
  release_channel {
    # Multiple per month upgrade cadence; Production users who need features not yet offered in the Stable channel.
    channel = "REGULAR"
  }

  # still don't know the use of this
  network_policy {
    provider = "PROVIDER_UNSPECIFIED"
    enabled  = true
  }


  private_cluster_config {
    #  the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled.
    enable_private_endpoint = true
    #
    enable_private_nodes = true
    # set the cidr of restricted "bits must be between 28"
    #error below
    master_ipv4_cidr_block = "172.16.0.0/28"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = google_compute_subnetwork.management-subnet.ip_cidr_range
      display_name = "test"
    }
  }

}
