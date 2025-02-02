resource "google_storage_bucket_iam_binding" "binding" {
  bucket = var.bucket_name
  role   = var.role

  members = [
    "serviceAccount:${var.service_account_email}"
  ]
}
