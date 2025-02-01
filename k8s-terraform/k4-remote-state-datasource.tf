data "terraform_remote_state" "gke" {
    backend = "gcs"
    config = {
      bucket = "terraform-on-gcp-gke"
      prefix = "dev/gke-cluster-public"
    }
}

output "gke_cluster_name" {
    value = data.terraform_remote_state.gke.outputs.gke_cluster_name
}

output "gke_cluster_location" {
    value = data.terraform_remote_state.gke.outputs.gke_cluster_location
}