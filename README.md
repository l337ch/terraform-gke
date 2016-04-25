# terraform-gke
_Building a Google Container Cluster on Google Compute using terraform-gke_

## Prerequisites
* terraform > version 0.6.14
* gcloud commandline tool
* kubectl > version 1.2.2

## Getting Started

Create a Terraform variables file in the parent directory with the following content to supply the required
parameters.
```json
gcp_credentials = "[location of Google Compute credentials]"
gcp_project = "[Google Compute project name]"
cluster_name = "[Name of the Google Container cluster]"
```

See the section below on how to obtain the Google Compute credentials file.
Save this file in the same directory where this project is located with a `.tfvars` extension.

### Start it up

To create a Google Container cluster run:
```bash
terraform apply -var-file=[location of variables file created above] -input=false -refresh=false ./
```

Run `kubectl cluster-info` to view available services running on your cluster. You should see output similar to below.
```bash
Kubernetes master is running at https://130.211.204.57
GLBCDefaultBackend is running at https://130.211.204.57/api/v1/proxy/namespaces/kube-system/services/default-http-backend
Heapster is running at https://130.211.204.57/api/v1/proxy/namespaces/kube-system/services/heapster
KubeDNS is running at https://130.211.204.57/api/v1/proxy/namespaces/kube-system/services/kube-dns
kubernetes-dashboard is running at https://130.211.204.57/api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard
```

### Tear it down

To destroy the Google Container cluster that was just created.
```bash
terraform destory
```

### Google Credentials

Follow these instructions to download the credentials file from Google for Google Compute:

1.  Log into the Google Developers Console and select a project
2.  Click the menu button in the top left corner, and navigate to "Permissions", then "Service accounts", and finally "Create service account"
3.  Provide a name and ID in the corresponding fields, select "Furnish a new private key", and select "JSON" as the key type
4.  Clicking "Create" will download your credentials
