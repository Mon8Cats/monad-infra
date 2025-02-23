output "iam_bindings" {
  description = "The IAM bindings created for the service account."
  value       = google_project_iam_member.sa_role_binding
}