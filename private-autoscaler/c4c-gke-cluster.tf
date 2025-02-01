provider "google" {
  project = "my-project-id"
  region  = "us-central1"
}

resource "google_compute_network" "vpc_network" {
  name                    = "gke-private-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "gke_subnet" {
  name          = "gke-private-subnet"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.0.0.0/16"  # Node IP range
  region        = "us-central1"

  secondary_ip_range {
    range_name    = "gke-pods"
    ip_cidr_range = "10.1.0.0/16"  # Pod CIDR range
  }

  secondary_ip_range {
    range_name    = "gke-services"
    ip_cidr_range = "10.2.0.0/20"  # Service CIDR range
  }
}

resource "google_container_cluster" "private_gke" {
  name     = "private-cluster"
  location = "us-central1"
  network  = google_compute_network.vpc_network.id
  subnetwork = google_compute_subnetwork.gke_subnet.id

  remove_default_node_pool = true
  initial_node_count       = 1

  private_cluster_config {
    enable_private_nodes    = true  # Nodes do not get public IPs
    enable_private_endpoint = false # API Server accessible via external IP
    master_ipv4_cidr_block  = "172.16.0.0/28" # Control plane IP range
  }

  ip_allocation_policy {
    #cluster_ipv4_cidr_block = "10.2.0.0/21"
    #services_ipv4_cidr_block = "10.3.0.0/21"
    cluster_secondary_range_name  = google_compute_subnetwork.gke_subnet.secondary_ip_range[0].range_name  
    # "gke-pods"
    services_secondary_range_name = google_compute_subnetwork.gke_subnet.secondary_ip_range[1].range_name  
    # "gke-services"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "0.0.0.0/0"
      # "35.235.240.0/20" # Allow GCP Cloud Shell Access
      display_name = "entire internet"
      # "GCP Cloud Shell"
    }
  }
}

resource "google_container_node_pool" "private_nodes" {
  name       = "private-node-pool"
  cluster    = google_container_cluster.private_gke.id
  initial_node_count = 1
  #node_count = 2
  autoscaling {
    min_node_count = 1
    max_node_count = 3
    location_policy = "ANY"
  }

  node_config {
    machine_type    = "e2-medium"
    disk_size_gb    = 20
    disk_type = "pd-standard"
    image_type      = "COS_CONTAINERD"
    service_account = "my-gke-service-account@my-project-id.iam.gserviceaccount.com"
    preemptible     = true # false

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    tags = [tolist(google_compute_firewall.allow-ssh.target_tags)[0]]
  }
}

###
resource "google_compute_router" "nat_router" {
  name    = "nat-router"
  network = google_compute_network.vpc_network.id
  region  = "us-central1"
}

resource "google_compute_router_nat" "cloud_nat" {
  name                               = "cloud-nat"
  router                             = google_compute_router.nat_router.name
  region                             = google_compute_router.nat_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["YOUR_IP/32"]
}
