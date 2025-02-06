resource "google_cloudbuildv2_repository" "github_repo" {
  location = var.region
  name               = var.repo_name
  parent_connection  = "projects/${var.project_id}/locations/${var.region}/connections/${var.connection_name}"
  remote_uri         = "https://github.com/${var.repo_owner}/${var.repo_name}.git"
}