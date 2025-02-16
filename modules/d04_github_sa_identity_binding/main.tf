
resource "google_service_account_iam_binding" "binding" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.service_account_email}"
  role              = "roles/iam.workloadIdentityUser"
  members = [
    "principalSet://iam.googleapis.com/projects/${var.project_id}/locations/global/workloadIdentityPools/${var.pool_id}/attribute.repository/${var.github_owner_repo}"
  ]
}