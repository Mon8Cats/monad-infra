variable "project_id" {
  description = "The GCP project ID where the secret exists."
  type        = string
}

variable "secret_id" {
  description = "The name of the secret to grant access to."
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account to be granted access."
  type        = string
}

variable "role" {
  description = "The IAM role to assign."
  type        = string
  default     = "roles/secretmanager.secretAccessor"
}