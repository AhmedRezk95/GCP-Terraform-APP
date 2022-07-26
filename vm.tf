resource "google_compute_instance" "bastion-vm" {
  name         = "bastion-vm"
  machine_type = var.machine_type
  zone         = var.machine_zone

  # vpc tags
  # based on firewall.tf we set there target_tags = ["ssh"]
  # this must be mentioned otherwise we will not have the access to the this vm through the firewall
  tags = ["ssh"]

  boot_disk {
    initialize_params {
      image = var.machine_image
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    # set your subnet 
    # omit access_config to confirm its private vm
    subnetwork = module.network.management_subnet_name
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # set the service-account that i created before
    #email  = "terraform-service-account@ahmed-rizk.iam.gserviceaccount.com"

    email = module.serviceaccount.serviceaccount_email
    # set permission to gke
    scopes = ["cloud-platform"]
  }
  
  metadata_startup_script = file("./configuration.sh")
}