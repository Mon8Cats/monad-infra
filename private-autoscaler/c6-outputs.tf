
output "gke_cluster_name" {
    description = "GKE cluster name"
    value = google_container_cluster.gke_cluser.name
}

output "gke_cluster_location" {
    description = "GKE cluster location"
    value = google_container_cluster.gke_cluster.location 
}

output "gke_cluster_endpoint" {
    description = "GKE cluster endpoint"
    value = google_container_cluster.gke_cluster.endpoint 
}

output "gke_cluster_master_version" { 
    description = "GKE cluster master version"
    value = google_container_cluster.gke_cluster.master_version
}





