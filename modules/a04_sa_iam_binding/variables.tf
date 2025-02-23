variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "service_account_email" {
  description = "The email address of the service account to bind roles to."
  type        = string
}

variable "roles" {
  description = "A list of roles to assign to the service account."
  type        = list(string)
}

