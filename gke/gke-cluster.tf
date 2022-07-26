
resource "google_container_cluster" "primary" {
  name     = var.gke_name
  location = var.gke_location

  # define vpc
  network = var.vpc_name

  # set the restricted subnet to the cluster
  subnetwork = var.restricted_subnet_name

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  # Set networking_mode requires the ip_allocation_policy block to be defined.
  # by default if it is not set, GKE will create a ROUTES-based cluster. 
  networking_mode = var.networking_mode


  ip_allocation_policy {
    # ip ranges for pods
    cluster_secondary_range_name = var.cluster_secondary_range_name
    # ip ranges for services
    services_secondary_range_name = var.service_secondary_range_name
  }

  # the following block regarding upgrading the cluster 
  # provide more control over automatic upgrades of your GKE clusters.
  release_channel {
    # Multiple per month upgrade cadence; Production users who need features not yet offered in the Stable channel.
    channel = var.release_channel
  }

  # still don't know the use of this
  network_policy {
    provider = var.network_policy
    enabled  = true
  }


  private_cluster_config {
    #  the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled.
    enable_private_endpoint = true
    #
    enable_private_nodes = true
    # set the cidr of restricted "bits must be between 28"
    #error below
    master_ipv4_cidr_block = var.private_cluster_config
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.management_subnet_cidr
      display_name = "test"
    }
  }

}