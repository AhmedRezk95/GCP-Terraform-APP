# resource "google_compute_instance_iam_binding" "binding" {
#   project = google_compute_instance.bastion-vm.project
#   zone = google_compute_instance.bastion-vm.zone
#   instance_name = google_compute_instance.bastion-vm.name

#   # i still don't know if the role below is the right one or not !
#   role = "roles/compute.networkUser"
#   members = [
#     "serviceaccount:",
#   ]
# }

# create serviceaccount which has gke access from vm 
resource "google_service_account" "k8s-service-account" {
  account_id   = "k8s-service-account-id"
  display_name = "k8s-service-account"
}

resource "google_project_iam_member" "member" {
  project = "ahmed-rizk"
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.k8s-service-account.email}"

}