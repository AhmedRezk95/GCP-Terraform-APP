
# create serviceaccount which has gke access from vm 
resource "google_service_account" "k8s-service-account" {
  account_id   = "k8s-service-account-id"
  display_name = "k8s-service-account"
}

resource "google_project_iam_member" "member" {
  project = "ahmed-rizk"
  # set the correct role
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.k8s-service-account.email}"

}