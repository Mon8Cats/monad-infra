output "wi_pool_id" {
  description = "The ID of Workload Identity Pool"
  value       = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
}

output "wi_pool_provider_id" {
  description = "The ID of Workload Identity Pool Provider"
  value       = google_iam_workload_identity_pool_provider.github_provider.workload_identity_pool_provider_id
}
