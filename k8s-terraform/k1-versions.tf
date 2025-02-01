terraform {
    required_version = "~>1.9"
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "~> 5.38.0"
      }
      kubernetes = {
        source = "hashicorp/kubernetes"
        version = "~> 2.32"
      }
    }

    backend "gcs" {
        bucket = "mon-tf-state"
        prefix = "dev/k8s"      
    }
}

/*
provider "google" {
    project = var.project_id
    region = var.region  
}
*/