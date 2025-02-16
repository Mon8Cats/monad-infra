resource "google_cloudbuildv2_repository" "github_repo" {
  location = var.location
  name               = var.repo_name
  parent_connection  = "projects/${var.project_id}/locations/${var.location}/connections/${var.connection_name}"
  remote_uri         = "https://github.com/${var.repo_owner}/${var.repo_name}.git"
}