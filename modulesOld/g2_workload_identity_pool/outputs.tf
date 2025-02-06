
# input for iam binding
output "wip_name" {
  value = google_iam_workload_identity_pool.github_pool.name
}

output "wip_id" {
  value = google_iam_workload_identity_pool.github_pool.id
}

# input for pool provider
output "wip_short_id" {
  value = google_iam_workload_identity_pool.github_pool.workload_identity_pool_id
  description = "Short ID of the Workload Identity Pool"
}