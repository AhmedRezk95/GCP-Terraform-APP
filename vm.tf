# create serviceaccount which has gke access from vm 
resource "google_service_account" "gke-service-account" {
  account_id   = "gke-service-account-id"
  display_name = "gke-service-account"
}

resource "google_compute_instance" "bastion-vm" {
  name         = "bastion-vm"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"

  # vpc tags
  # based on firewall.tf we set there target_tags = ["ssh"]
  # this must be mentioned otherwise we will not have the access to the this vm through the firewall
  tags = ["ssh"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    # set your subnet 
    # omit access_config to confirm its private vm
    subnetwork = google_compute_subnetwork.management-subnet.name
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # set the service-account that i created before
    #email  = "terraform-service-account@ahmed-rizk.iam.gserviceaccount.com"

    email = google_service_account.gke-service-account.email
    # set permission to gke
    scopes = ["cloud-platform"]
  }
}