/*
module "enable_gcp_apis" {
  source     = "./modules/gcp_enable_apis"
  project_id = "my-project-id"
  apis = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "container.googleapis.com",
    "artifactregistry.googleapis.com"
  ]
}
*/

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

resource "google_project_service" "enabled_apis" {
  for_each = toset(var.apis)

  project = var.project_id
  service = each.key

  disable_dependent_services = false
  disable_on_destroy         = false
}
