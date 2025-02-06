output "service_account_binding" {
  description = "IAM binding for the service account"
  value       = google_service_account_iam_binding.binding
}