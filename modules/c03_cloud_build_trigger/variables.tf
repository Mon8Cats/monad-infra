variable "project_id" {
  description = "The GCP project ID where the repository is linked"
  type        = string
}


variable "location" {
  description = "Location for the Workload Identity Pool"
  type        = string
  default     = "global"
}


variable "service_account_email" {
  description = "Service account email to run the Cloud Build trigger"
  type        = string
}

variable "secret_id_github" {
  description = "The Github Token Secret Id"
  type        = string
}

variable "connection_name" {
  description = "The name of the existing Cloud Build connection"
  type        = string
}

variable "repo_name" {
  description = "The name of the GitHub repository to link"
  type        = string
}

variable "repo_type" {
  description = "Type of repository (GITHUB, GITHUB_ENTERPRISE, BITBUCKET_CLOUD, BITBUCKET_SERVER)"
  type        = string
  default     = "GITHUB"
}

variable "branch_name" {
  description = "Branch to trigger builds (e.g., main)"
  type        = string
}

variable "github_owner" {
  description = "The owner (username or organization) of the GitHub repository"
  type        = string
}

variable "substitutions" {
  description = "Map of build-time environment variables"
  type        = map(string)
  default     = {}
}