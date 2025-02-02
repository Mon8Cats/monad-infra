# Terraform Settings Block
terraform {
  required_version = ">= 1.5.7"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 6.0.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 6.0.0"
    }
  }

  backend "gcs" {
    bucket  = "spn-run-tf-backend"
    prefix  = "terraform/state/infra" 
  }
}

provider "google" {
  project = var.project_id
  region = var.region
}

provider "google-beta" {
  alias   = "beta"
  project = var.project_id
  region  = var.region
}