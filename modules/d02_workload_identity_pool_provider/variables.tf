variable "project_id" {
  description = "GCP Project ID"
  type        = string
}


variable "workload_identity_pool_id" {
  description = "ID of the Workload Identity Provider"
  type        = string
}


variable "provider_id" {
  description = "ID of the Workload Identity Provider"
  type        = string
}

variable "provider_display_name" {
  description = "Display name for the Workload Identity Provider"
  type        = string
  default     = "My Workload Identity Provider"
}

variable "provider_description" {
  description = "Description of the Workload Identity Provider"
  type        = string
  default     = "Provider for external authentication"
}

variable "issuer_uri" {
  description = "OIDC Issuer URI (e.g., GitHub Actions: 'https://token.actions.githubusercontent.com')"
  type        = string
}

variable "attribute_mapping" {
  description = "Mapping of external identity attributes to GCP attributes"
  type        = map(string)
}

variable "github_owner_repo" {
  description = "GitHub repository in format OWNER/REPO"
  type        = string
}
