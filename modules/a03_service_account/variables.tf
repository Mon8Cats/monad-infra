variable "project_id" {
  description = "The GCP project ID where APIs will be enabled"
  type        = string
}

variable "service_account_id" {
  description = "The account ID for the service account to create. This must be unique within the project."
  type        = string
}

variable "service_account_display_name" {
  description = "The display name for the service account."
  type        = string
}