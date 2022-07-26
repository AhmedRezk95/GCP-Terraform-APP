
variable "vpc_network_name" {
  type = string
  default = "terra-network"
}

variable "routing_mode" {
  type = string
  default = "REGIONAL"
}

variable "management-subnet-cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "restricted-subnet-cidr" {
  type = string
  default = "10.0.2.0/24"
}

variable "service_secondary_ip_cidr" {
  type = string
  default = "192.168.1.0/24"
}

variable "pod_secondary_ip_cidr" {
  type = string
  default = "192.168.64.0/24"
}

variable "vpc_region" {
  type = string
  default = "us-east1"
}

variable "nat_ip_allocate_option" {
  type = string
  default = "AUTO_ONLY"
}

variable "source_subnetwork_ip_ranges_to_nat" {
  type = string
  default = "LIST_OF_SUBNETWORKS"
}