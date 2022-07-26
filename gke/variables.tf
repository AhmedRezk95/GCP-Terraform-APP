variable "vpc_name" {
  type = string
}

variable "restricted_subnet_name" {
  type = string
}

variable "cluster_secondary_range_name" {
  type = string
}

variable "service_secondary_range_name" {
  type = string
}

variable "management_subnet_cidr" {
  type = string
}

variable "serviceaccount_email" {
  type = string
}

variable "gke_name" {
  type = string
  default = "my-gke-cluster"
}


variable "gke_location" {
  type = string
  default = "us-east1-b"
}

variable "networking_mode" {
  type = string
  default = "VPC_NATIVE"
}

variable "release_channel" {
  type = string
  default = "REGULAR"
}

variable "network_policy" {
  type = string
  default = "PROVIDER_UNSPECIFIED"
}

variable "private_cluster_config" {
  type = string
  default = "172.16.0.0/28"
}

variable "node_pool_name" {
  type = string
  default = "my-node-pool"
}

variable "node_machine" {
  type = string
  default = "g1-small"
}
variable "node_count" {
  type = number
  default = 1
}

variable "max_pods_per_node" {
  type = number
  default = 65
}
