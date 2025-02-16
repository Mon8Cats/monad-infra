/*
repository id: the fully qualified repository name
    projects/{project_id}/locations/{region}/connections/{connection_name}/repositories/{repo_name}
repository name: the same as the input connection name
*/

output "cloud_build_trigger_name" {
  value = google_cloudbuild_trigger.github_trigger.name
}