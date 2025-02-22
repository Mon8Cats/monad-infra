/*
module "gcs_bucket" {
  source      = "./modules/gcp_storage_bucket"
  bucket_name = "my-unique-bucket-name"
  location    = "US-CENTRAL1"
  storage_class = "STANDARD"
  force_destroy = false
  enable_versioning = true
  lifecycle_delete_days = 60
  labels = {
    environment = "dev"
    owner       = "user"
  }
}
*/

/*
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}
*/

resource "google_storage_bucket" "bucket" {
  name          = var.bucket_name
  project       = var.project_id
  location      = var.location
  storage_class = var.storage_class
  force_destroy = var.force_destroy

  uniform_bucket_level_access = var.uniform_bucket_level_access

  versioning {
    enabled = var.enable_versioning
  }

  lifecycle_rule {
    condition {
      age = var.lifecycle_delete_days
    }
    action {
      type = "Delete"
    }
  }

  labels = var.labels
}
