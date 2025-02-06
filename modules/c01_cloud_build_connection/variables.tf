variable "project_id" {
  description = "The GCP project ID where the connection is created"
  type        = string
}

variable "region" {
  description = "The region for the Cloud Build connection"
  type        = string
  default     = "us-central1"
}

variable "connection_name" {
  description = "The name of the Cloud Build connection"
  type        = string
}

variable "github_app" {
  description = "Set to true if using a GitHub App, otherwise false"
  type        = bool
  default     = false
}

variable "github_app_installation_id" {
  description = "The GitHub App installation ID (required if github_app is true)"
  type        = string
  default     = ""
}

variable "github_access_token_secret_id" {
  description = "The GitHub Access Token secret ID)"
  type        = string
  default     = ""
}
