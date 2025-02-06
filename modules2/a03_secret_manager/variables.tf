variable "project_id" {
  description = "The GCP project ID where the secret will be created"
  type        = string
}

variable "secret_name" {
  description = "The name of the secret"
  type        = string
}

variable "secret_value" {
  description = "The value of the initial secret version (optional, can be null)"
  type        = string
  default     = null
}

variable "replication_policy" {
  description = "Replication policy type (automatic or user_managed)"
  type        = string
  default     = "automatic"
}

variable "replication_locations" {
  description = "List of regions for user-managed replication (used if replication_policy is 'user_managed')"
  type        = list(string)
  default     = []
}

variable "labels" {
  description = "A map of labels to assign to the secret"
  type        = map(string)
  default     = {}
}

