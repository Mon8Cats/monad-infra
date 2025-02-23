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


variable "api_list" {
  description = "A list of APIs"
  type        = list(string)
}

/*
variable "bucket_name_unique" {
  description = "The bucket for TF backend"
  type        = string
}
*/

variable "secret_id_github" {
  description = "The Github Token Secret Id"
  type        = string
}
variable "secret_data_github" {
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

### repo-infra related
variable "cicd_log_bucket_infra" {
  description = "The bucket for cloud build log"
  type        = string
}

variable "github_repo_infra" {
  description = "The region for the resources"
  type        = string
}
variable "repo_name_gcp_infra" {
  description = "The region for the resources"
  type        = string
}

variable "cicd_sa_id_infra" {
  type        = string
  description = "The ID of the service account to create (must be unique within the project)"

}

variable "cicd_sa_role_list_infra" {
  type        = list(string)
  description = "A list of service account roles"
}
