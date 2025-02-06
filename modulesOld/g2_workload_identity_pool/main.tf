resource "google_iam_workload_identity_pool" "github_pool" {
  provider                  = google #google-beta
  project                   = var.project_id
  workload_identity_pool_id = var.wi_pool_id
  display_name              = var.wi_pool_name
  description               = "WI Pool"
}