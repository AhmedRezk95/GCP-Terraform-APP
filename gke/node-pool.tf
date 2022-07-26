resource "google_container_node_pool" "node_pool" {
  name       = var.node_pool_name
  location   = var.gke_location
  cluster    = google_container_cluster.primary.name
  
  node_count = var.node_count
  max_pods_per_node = var.max_pods_per_node

  node_config {
    preemptible  = true
    machine_type = var.node_machine
  
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.serviceaccount_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  } 
}