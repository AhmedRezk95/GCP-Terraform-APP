variable "project_id" {
  type = string
  default = "ahmed-rizk"
}

variable "gcr_location" {
  type = string
  default = "US"
}

variable "region" {
  type = string
  default = "us-east1"
}

variable "machine_type" {
  type = string
  default = "n1-standard-1"
}

variable "machine_zone" {
  type = string
  default = "us-east1-b"
}

variable "machine_image" {
  type = string
  default = "debian-cloud/debian-11"
}

variable "backend_bucket" {
  type = string
  default = "tf-state-rizk"
}
