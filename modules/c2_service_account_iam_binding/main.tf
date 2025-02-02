resource "google_service_account_iam_member" "cloud_run_sa_iam_binding" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.cloud_run_sa}"
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${var.cicd_sa}"
}
