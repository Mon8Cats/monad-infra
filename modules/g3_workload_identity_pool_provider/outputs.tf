output "provider_name" {
  description = "The full resource name of the workload identity pool provider."
  value       = google_iam_workload_identity_pool_provider.github_provider.name
}
