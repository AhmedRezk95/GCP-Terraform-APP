resource "google_container_registry" "my-registry" {
  project  = var.project_id
  # Set REGION TO US
  location = var.gcr_location
}

resource "google_storage_bucket_iam_member" "viewer" {
  bucket = google_container_registry.my-registry.id
  role = "roles/storage.objectViewer"
  # set permission to the same as node pool serviceAccount
  member = "serviceAccount:${module.serviceaccount.serviceaccount_email}"

}