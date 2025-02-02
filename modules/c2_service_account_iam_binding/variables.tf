variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "cloud_run_sa" {
  description = "The Cloud Run service account email"
  type        = string
}

variable "cicd_sa" {
  description = "The CICD service account email"
  type        = string
}