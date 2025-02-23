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
    prefix  = "infra/common" 
  }
}

provider "google" {
  project = var.project_id
  region = var.region
  #credentials = file("path/to/credentials/sa-terraform.json")
  credentials = file(var.credentials_file)
}

provider "google-beta" {
  alias   = "beta"
  project = var.project_id
  region  = var.region
  #credentials = file("path/to/credentials/sa-terraform.json")
  credentials = file(var.credentials_file)
}