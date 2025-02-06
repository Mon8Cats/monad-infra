variable "project_id" {
  description = "The GCP project ID where the repository is linked"
  type        = string
}

variable "region" {
  description = "The region for the Cloud Build repository link"
  type        = string
  default     = "us-central1"
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