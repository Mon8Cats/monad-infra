
# the fully qualified identifier 
# projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/my-pool-id
output "workload_identity_pool_id" {
  description = "Workload Identity Pool ID"
  value       = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
}