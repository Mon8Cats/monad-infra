variable "project_id" {
  description = "The GCP project ID where the secret will be created"
  type        = string
}

variable "secret_id" {
  description = "Name of the secret in Secret Manager"
  type        = string
}


variable "secret_value" {
  description = "The value of the initial secret version (optional, can be null)"
  type        = string
  default     = null
}

/*
variable "secret_accessors" {
  description = "Map of IAM members (service accounts, users, groups) with access"
  type        = map(list(string))
  default     = {}
}
*/