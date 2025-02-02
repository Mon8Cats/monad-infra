variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "ID of the GitHub token secret in Secret Manager"
  type        = string
}

variable "connection_parent" {
  description = "ID of the GitHub token secret in Secret Manager"
  type        = string
}


variable "repo_name_gcp" {
  description = "The repository name in GCP"
  type        = string
}

variable "repo_uri_remote" {
  description = "Custom service account email for Cloud Build"
  type        = string
}

variable "trigger_name" {
  description = "Name of the Cloud Build trigger"
  type        = string
}

variable "github_account" {
  description = "Name of the Cloud Build trigger"
  type        = string
}


variable "branch_regex" {
  description = "Regex for branches to trigger builds"
  type        = string
  default     = ".*" # Trigger on all branches
}

variable "service_account_email" {
  description = "service account for the ci-cd pipeline"
  type        = string
}

variable "cloudbuild_yaml_path" {
  description = "ID of the GitHub token secret in Secret Manager"
  type        = string
}