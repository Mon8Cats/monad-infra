variable "project_id" {
  description = "Project ID for the GCP project"
  type        = string
}

variable "project_number" {
    description = "Project Number for the GCP project"
  type        = string
}

variable "region" {
  description = "Region in which GCP Resources to be created"
  type = string
  #default = "us-central1"
}

variable "apis" {
  description = "A list of APIs"
  type        = list(string)
}

variable "access_token_secret_id" {
  description = "The Github Token Secret Id"
  type        = string
}
variable "access_token_secret_value" {
  description = "The Github Token Secret value"
  type        = string
}


variable "connection_name_github" {
  description = "ID of the GitHub token secret in Secret Manager"
  type        = string
}

variable "app_installation_id_github" {
  description = "Custom service account email for Cloud Build"
  type        = string  
}

variable "github_account" {
  description = "The region for the resources"
  type        = string
}

variable "credentials_file" {
  description = "Path to the service account key file used for authentication."
  type        = string
}

variable "sa-terraform" {
  description = "The account ID for the service account to run the terraform"
  type        = string
}