resource "google_secret_manager_secret_version" "secret_version" {
  secret      = "projects/${var.project_id}/secrets/${var.secret_id}"
  secret_data = var.secret_value
}
