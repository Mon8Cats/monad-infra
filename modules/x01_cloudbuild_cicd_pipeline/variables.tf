variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "project_number" {
  description = "Project number for the GCP project"
  type        = string
}

variable "location" {
  description = "Region for the Cloud Build trigger"
  type        = string
  default     = "us-central1"
}

variable "api_services" {
  description = "List of API services to enable"
  type        = list(string)
}

variable "service_account_id" {
  description = "The ID of the Service Account"
  type        = string
}



variable "secret_id_github" {
  description = "The Github Token Secret Id"
  type        = string
}

variable "log_bucket_name" {
  description = "Name of the Cloud Build Log bucket"
  type        = string
}


variable "wip_id" {
  description = "ID of the Workload Identity Pool"
  type        = string
}

variable "wip_provider_id" {
  description = "ID of the Workload Identity Provider"
  type        = string
}

variable "wip_provider_display_name" {
  description = "Display name for the Workload Identity Provider"
  type        = string
  default     = "My Workload Identity Provider"
}

variable "wip_provider_description" {
  description = "Description of the Workload Identity Provider"
  type        = string
  default     = "Provider for external authentication"
}

variable "github_owner" {
  description = "GitHub username or organization"
  type        = string
}

variable "repo_name" {
  description = "GitHub repository name"
  type        = string
}

variable "repo_type" {
  description = "Type of repository (GITHUB, GITHUB_ENTERPRISE, BITBUCKET_CLOUD, BITBUCKET_SERVER)"
  type        = string
  default     = "GITHUB"
}


variable "branch_name" {
  description = "Branch to trigger builds (e.g., main)"
  type        = string
  default     = "main"
}


variable "github_owner_repo" {
  description = "GitHub repository in format OWNER/REPO"
  type        = string
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

variable "substitutions" {
  description = "Map of build-time environment variables"
  type        = map(string)
  default     = {}
}

variable "connection_name" {
  description = "The name of the existing Cloud Build connection"
  type        = string
}
