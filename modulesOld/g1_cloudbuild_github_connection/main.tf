resource "google_cloudbuildv2_connection" "github_connection" {
  location = var.region
  name = var.connection_name_github

  github_config {
    app_installation_id = var.app_installation_id_github

    authorizer_credential {

      oauth_token_secret_version = "projects/${var.project_id}/secrets/${var.secret_id_github}/versions/latest"
    }
  }
}
