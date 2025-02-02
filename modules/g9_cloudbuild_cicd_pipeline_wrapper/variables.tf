variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  type        = string
  description = "ID of the GitHub token secret in Secret Manager"
}

variable "cicd_sa_id" {
  type        = string
  description = "The ID of the service account to create (must be unique within the project)"

}

variable "cicd_sa_role_list" {
  type        = list(string)
  description = "The list of service account roles"
}


variable "cicd_log_bucket" {
  type        = string
  description = "The bucket to log cicd"
}


variable "secret_id_github_token" {
  type        = string
  description = "The secret id of github token"
}

variable "secret_id_db_user" {
  type        = string
  description = "The secret id of github token"
}

variable "secret_id_db_password" {
  type        = string
  description = "The secret id of github token"
}


variable "wip_name" {
  description = "name of the workload idenitity pool"
  type        = string
}

/*
variable "wip_id" {
  description = "Id of the workload idenitity pool"
  type        = string
}
*/

variable "wip_short_id" {
  description = "Id of the workload idenitity pool"
  type        = string
}



variable "wip_provider_id" {
  description = "Id of the workload idenitity provider"
  type        = string
}

# git_acct/git_repo format
variable "github_acct_repo" {
  description = "Name of the github_repository"
  type        = string
}


variable "repo_name_gcp" {
  description = "Name of the github_repository"
  type        = string
}

variable "repo_connection_name" {
  description = "Name of the github_repository"
  type        = string
}

variable "repo_uri_remote" {
  description = "Name of the github_repository"
  type        = string
}

/*
variable "wip_short_id" {
  type        = string
  description = "The wip id"
}

variable "wip_provider_id" {
  type        = string
  description = "The wip provider id"
}

variable "github_acct_repo" {
  type        = string
  description = "The GitHub account and repo"
}


variable "wi_pool_id" {
  description = "Id of the workload idenitity pool"
  type        = string
}

variable "wi_pool_name" {
  description = "name of the workload idenitity pool"
  type        = string
}

variable "wi_pool_provider_id" {
  description = "Id of the workload idenitity provider"
  type        = string
}

variable "github_repository" {
  description = "Name of the github_repository"
  type        = string
}

*/