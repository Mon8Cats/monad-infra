variable "project_id" {
  description = "The GCP project ID where the repository is linked"
  type        = string
}

variable "location" {
  description = "Location for the Workload Identity Pool"
  type        = string
  default     = "global"
}

variable "connection_name" {
  description = "The name of the existing Cloud Build connection"
  type        = string
}

variable "repo_name" {
  description = "The name of the GitHub repository to link"
  type        = string
}



variable "repo_owner" {
  description = "The owner (username or organization) of the GitHub repository"
  type        = string
}