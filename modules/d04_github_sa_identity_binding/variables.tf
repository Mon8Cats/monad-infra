variable "project_id" {
  description = "The GCP project ID where the repository is linked"
  type        = string
}


variable "service_account_email" {
  description = "The ID of the Service Account"
  type        = string
}

variable "pool_id" {
  description = "ID of the Workload Identity Pool"
  type        = string
}

variable "github_owner_repo" {
  description = "GitHub repository in format OWNER/REPO"
  type        = string
}
