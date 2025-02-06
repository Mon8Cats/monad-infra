variable "project_id" {
  description = "ID of the GitHub token secret in Secret Manager"
  type        = string
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

variable "cicd_sa_id" {
  description = "CI-CD service account Id"
  type        = string
}