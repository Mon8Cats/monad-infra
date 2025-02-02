resource "google_secret_manager_secret" "secret" {
  project     = var.project_id
  secret_id = var.secret_id
  
  replication {
     user_managed {
      replicas {
        location = "us-central1"
      }
    }
  }
}

resource "google_secret_manager_secret_version" "secret_version" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.secret_data
}

# save twice to enable "latest"
resource "google_secret_manager_secret_version" "secret_version2" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.secret_data
}
