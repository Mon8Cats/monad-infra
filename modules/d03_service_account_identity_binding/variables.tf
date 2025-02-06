variable "service_account_id" {
  description = "The ID of the Service Account"
  type        = string
}

variable "role" {
  description = "IAM role to assign (e.g., roles/iam.workloadIdentityUser)"
  type        = string
}

variable "members" {
  description = "List of identity members allowed to impersonate the service account"
  type        = list(string)
}
