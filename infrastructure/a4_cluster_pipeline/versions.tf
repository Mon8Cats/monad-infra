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
    bucket  = "dole-dole"
    prefix  = "infra/cluster-pipe" 
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