resource "google_compute_firewall" "rizk-firewall" {
  name    = "rizk-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  # set source tag "inbound traffic"
  # we will set target tag to specify which machine should this firewall use
  # we will mention the same tag in our vm as tags
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
