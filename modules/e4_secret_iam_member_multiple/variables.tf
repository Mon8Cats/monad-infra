variable "member" {
  description = "The member to whom access will be granted. Example: serviceAccount:my-service-account@example.com"
  type        = string
}

variable "secret_ids" {
  description = "List of Secret IDs to grant access to."
  type        = list(string)
}

variable "role" {
  description = "The IAM role to assign for the member on the secrets."
  type        = string
  default     = "roles/secretmanager.secretAccessor"
}
