
# vpc
resource "google_compute_network" "myvpc" {
  name = "${local.name}-vpc"
  auto_create_subnetworks = false
}

# subnet
resource "google_compute_subnetwork" "mysubnet" {
  name = "${var.region}-subnet"
  region = var.region
  ip_cidr_range = "10.128.0.0/20"
  network = google_compute_network.myvpc.id
  private_ip_google_access = true
}

# firewall
resource "google_compute_firewall" "fw_ssh" {
    name = "${local.name}-fwrule-allow-ssh22"
    allow {
        ports = ["22"]
        protocol = "tcp"
    }
    direction = "INGRESS"
    network = google_compute_network.myvpc.id
    priority = 1000
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["ssh-tag"]
}

# service account
resource "google_service_account" "gke_sa" {
  account_id = "${local.name}-gke-sa"
  display_name = "${local.name} GKE service account"
}

# gke cluster
resource "google_container_cluster" "gke_cluster" {
  name = "${local.name}-gke-cluster"
  location = var.region

  # node pool
  remove_default_node_pool = true 
  initial_node_count = 1

  # network
  network = google_compute_network.myvpc.self_link 
  subnetwork = google_compute_subnetwork.mysubnet.self_link 

  # in production change it to true 
  deletion_protection = false 
}

# linux node pool
resource "google_container_node_pool" "node_pool" {
  name = "${local.name}-node-pool"
  cluster = google_container_cluster.gke_cluster.id 
  node_count = 1 

  node_config {
    preemptible = true
    machine_type = var.machine_type 

    #
    service_account = google_service_account.gke_sa.email 
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    # firewall rule
    tags = [tolist(google_compute_firewall.fw_ssh.target_tags)[0]]
  }
  
}