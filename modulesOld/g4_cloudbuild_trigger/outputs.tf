output "repository_id" {
  value = google_cloudbuildv2_repository.my_repository.id
}

output "trigger_id" {
  description = "The ID of the Cloud Build trigger"
  value       = google_cloudbuild_trigger.trigger.id
}