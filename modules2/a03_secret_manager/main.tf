/*
module "gcp_secret" {
  source      = "./modules/gcp_secret_manager_secret"
  project_id  = "my-gcp-project"
  secret_name = "my-secret"
  secret_value = "my-super-secret-value"
  replication_policy = "automatic"
  labels = {
    environment = "dev"
    owner       = "user"
  }
}

module "gcp_secret" {
  source      = "./modules/gcp_secret_manager_secret"
  project_id  = "my-gcp-project"
  secret_name = "my-secret"
  replication_policy = "user_managed"
  replication_locations = ["us-central1", "europe-west1"]
}

*/

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

resource "google_secret_manager_secret" "secret" {
  name     = var.secret_name
  project  = var.project_id

  replication {
    dynamic "automatic" {
      for_each = var.replication_policy == "automatic" ? [1] : []
      content  = {}
    }

    dynamic "user_managed" {
      for_each = var.replication_policy == "user_managed" ? [1] : []
      content {
        dynamic "replicas" {
          for_each = var.replication_locations
          content {
            location = replicas.value
          }
        }
      }
    }
  }

  labels = var.labels
}

resource "google_secret_manager_secret_version" "version" {
  count      = var.secret_value != null ? 1 : 0
  secret     = google_secret_manager_secret.secret.id
  secret_data = var.secret_value
}

