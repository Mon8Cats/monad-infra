resource "google_cloudbuildv2_connection" "github_connection" {
  name       = var.connection_name
  project    = var.project_id
  location   = var.region

  github_config {
    app_installation_id = var.github_app_installation_id

    authorizer_credential {
      oauth_token_secret_version = "projects/${var.project_id}/secrets/${var.github_access_token_secret_id}/versions/latest"
    }
  }
}


