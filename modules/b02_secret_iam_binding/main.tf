resource "google_secret_manager_secret_iam_binding" "secret_access" {
  secret_id = var.secret_id
  role      = "roles/secretmanager.secretAccessor"

  members = [
    "serviceAccount:${var.service_account_email}"
  ]
}