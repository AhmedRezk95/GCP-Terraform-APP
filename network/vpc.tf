resource "google_compute_network" "vpc_network" {
  name = var.vpc_network_name
  # set auto creation to false so it can't add any regions
  auto_create_subnetworks = "false"
  routing_mode            = var.routing_mode

}
