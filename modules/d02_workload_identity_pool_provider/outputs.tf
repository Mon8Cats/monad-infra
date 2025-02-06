
# the fully qualified identifier 
# projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/my-pool-id
# projects/123456789/locations/global/workloadIdentityPools/github-ci-pool/providers/github-provider

output "workload_identity_provider_id" {
  description = "Workload Identity Provider ID"
  value       = google_iam_workload_identity_pool_provider.my_provider.workload_identity_pool_provider_id
}
