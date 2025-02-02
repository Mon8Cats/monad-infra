variable "project_id" {
  description = "The ID of the GCP project where the secret will be created."
  type        = string
}

variable "secret_id" {
  description = "The ID of the secret to create."
  type        = string
}

variable "secret_value" {
  description = "The value to store in the secret."
  type        = string
  sensitive   = true
}