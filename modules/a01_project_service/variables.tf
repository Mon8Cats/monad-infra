variable "project_id" {
  description = "The GCP project ID where APIs will be enabled"
  type        = string
}

variable "apis" {
  description = "List of GCP APIs to enable"
  type        = list(string)
}
