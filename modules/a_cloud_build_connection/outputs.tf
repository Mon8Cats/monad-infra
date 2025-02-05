/*
connection id: the fully qualified resource name
    projects/{project_id}/locations/{region}/connections/{connection_name}
connection name: the same as the input connection name
*/

output "connection_id" {
  description = "The ID of the created Cloud Build connection"
  value       = google_cloudbuildv2_connection.github_connection.id
}

output "connection_name" {
  description = "The name of the created Cloud Build connection"
  value       = google_cloudbuildv2_connection.github_connection.name
}