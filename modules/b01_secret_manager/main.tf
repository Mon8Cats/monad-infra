/* */

resource "google_secret_manager_secret" "my_secret" {
  project   = var.project_id
  secret_id = var.secret_id

  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }
    }
  }  
}

resource "google_secret_manager_secret_version" "my_secret_version" {
  count       = var.secret_value != "" ? 1 : 0
  secret      = google_secret_manager_secret.my_secret.id
  secret_data = var.secret_value
}

# to ensure latest version is used
resource "google_secret_manager_secret_version" "my_secret_version2" {
  count       = var.secret_value != "" ? 1 : 0
  secret      = google_secret_manager_secret.my_secret.id
  secret_data = var.secret_value
}

/*
resource "google_secret_manager_secret_iam_binding" "secret_iam_binding" {
  for_each = { for k, v in var.secret_accessors : k => v if v != "" }

  secret_id = google_secret_manager_secret.this.id
  role      = "roles/secretmanager.secretAccessor"

  members = each.value
}
*/