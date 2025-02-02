terraform {
    required_version = "~>1.9"
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "~> 5.38.0"
      }
    }

    backend "gcs" {
        bucket = "mon-tf-state"
        prefix = "dev/gke-cluster-public"      
    }
}


provider "google" {
    project = var.project_id
    region = var.region
  
}