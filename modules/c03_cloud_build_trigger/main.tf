
resource "google_cloudbuild_trigger" "github_trigger" {
  name     = "github-trigger-${var.repo_name}"
  project  = var.project_id
  location = var.location

  service_account = var.service_account_email

  source_to_build {
    repository = "projects/${var.project_id}/locations/${var.location}/connections/${var.connection_name}/repositories/${var.repo_name}"
    ref        = "refs/heads/${var.branch_name}"
    repo_type = var.repo_type
  }

  filename = "cloudbuild.yaml"  # Cloud Build config file in the repo

  included_files = ["**/*"]  # Monitor all files for changes

  github {
    owner = var.github_owner
    name  = var.repo_name
    push {
      branch = "^${var.branch_name}$"  # Regex for branch name
    }
  }

  substitutions = var.substitutions  # Pass build-time environment variables
}
