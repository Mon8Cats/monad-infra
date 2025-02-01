
provider "google" {
    project = var.project_id
    region = var.region  
}

# gke cluster: need name and location

data "google_container_cluster" "gke" {
  name = data.terraform_remote_state.gke.outputs.gke_cluster_name
  location = data.terraform_remote_state.gke.outputs.gke_cluster_location
}

output "gke_cluster_details" {
  value = { 
    gke_endpoint = data.google_container_cluster.gke.endpoint
    gke_cluster_ca_certificate = data.google_container_cluster.gke.master_auth.0.cluster_ca_certificate
  }
}

data "google_client_config" "default" {
  # no output for security reason
}


# $HOME/.kube/config # kube config file ?
provider "kubernetes" {
  host = "https://${data.google_container_cluster.gke.endpoint}" # cluster endpoint
  cluster_ca_certificate = base64decode(data.google_container_cluster.gke.master_auth.0.cluster)
  token = data.google_client_config.default.access_token
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command = "gke-cloud-auth-plugin"
  }
}

# project 2 -> data source : terraform_remote_state -> project1 -> tfstate 
# need info about cluster location and name dynamically
