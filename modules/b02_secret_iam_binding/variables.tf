variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "secret_id" {
  description = "Secret Manager secret ID"
  type        = string
}

variable "service_account_email" {
  description = "Email of an existing Service Account"
  type        = string
  default     = ""
}