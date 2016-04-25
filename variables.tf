variable "gcp_project" {
 description =  "Name of the Google Compute project to use"
}

variable "gcp_credentials" {
  description = "Credentials file to use for accessing Google Compute resources"
}
variable "gcp_region" {
  description = "Google Compute region to use for the cluster"
  default = "us-central1"
}

variable "cluster_name" {
  description = "Google Container Cluster name to use for the cluster"
}

variable "gcp_zone" {
  description = "Google Computer zone to use for the cluster"
  default = "us-central1-a"
}
