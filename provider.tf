provider "google" {
  project = "ahmed-rizk"
  region  = "us-east1"
  # set crediential for your project - must create serviceaccount first and set its key here
  credentials = file("/home/rizk/ahmed-rizk-83302619bcd0.json")
}