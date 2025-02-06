/*
repository id: the fully qualified repository name
    projects/{project_id}/locations/{region}/connections/{connection_name}/repositories/{repo_name}
repository name: the same as the input connection name
*/

output "repository_id" {
  description = "The ID of the created Cloud Build GitHub repository link"
  value       = google_cloudbuildv2_repository.github_repo.id
}

output "repository_name" {
  description = "The name of the linked GitHub repository"
  value       = google_cloudbuildv2_repository.github_repo.name
}
