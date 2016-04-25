// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.gcp_credentials}")}"
  project     = "${var.gcp_project}"
  region      = "${var.gcp_region}"
}

// Create the Google Container Cluster
resource "google_container_cluster" "primary" {
  name = "${var.cluster_name}"
  zone = "${var.gcp_zone}"
  initial_node_count = 3

  master_auth {
    username = "admin"
    password = "canttouchthis"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }

  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.cluster_name} --zone ${google_container_cluster.primary.zone}"
    }
}
