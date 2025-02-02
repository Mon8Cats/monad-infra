resource "google_secret_manager_secret_iam_member" "secret_access" {
  project    = var.project_id
  secret_id  = var.secret_id
  role       = var.role
  member     = "serviceAccount:${var.service_account_email}"
}