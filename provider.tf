provider "google" {
  project = var.project_id
  region  = var.region
  # set crediential for your project - must create serviceaccount first and set its key here
  credentials = file("/home/rizk/ahmed-rizk-83302619bcd0.json")
}