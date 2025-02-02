terraform {
  required_version = ">= 1.5.7"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 6.0.0"
    }
  }
  # no backend
}

# Terraform Provider Block
provider "google" {
  project = var.project_id
  region = var.region
}
