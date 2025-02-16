/*
module "cloud_build_connection" {
  source          = "./modules/cloud-build-connection"
  project_id      = "your-gcp-project-id"
  region          = "us-central1"
  connection_name = "cicd-connection"
  github_app      = false  # Set to true if using a GitHub App, false for personal access token (PAT)
}

*/

resource "google_cloudbuildv2_connection" "github_connection" {
  name       = var.connection_name
  project    = var.project_id
  location   = var.location

  github_config {
    app_installation_id = var.github_app_installation_id

    authorizer_credential {
      oauth_token_secret_version = "projects/${var.project_id}/secrets/${var.github_access_token_secret_id}/versions/latest"
    }
  }
}

