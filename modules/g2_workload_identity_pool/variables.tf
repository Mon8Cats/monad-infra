variable "project_id" {
  description = "ID of the GitHub token secret in Secret Manager"
  type        = string
}

variable "wi_pool_id" {
  description = "Id of the workload identity pool"
  type        = string
}

variable "wi_pool_name" {
  description = "name of the workload identity pool"
  type        = string
}



