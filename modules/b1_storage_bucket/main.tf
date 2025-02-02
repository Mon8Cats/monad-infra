resource "google_storage_bucket" "my_bucket" {
  name          = var.bucket_name
  project       = var.project_id
  location      = var.location
  storage_class = var.storage_class
  force_destroy = var.force_destroy

  lifecycle {
    prevent_destroy = false
  }

  versioning {
    enabled = true
  }
}