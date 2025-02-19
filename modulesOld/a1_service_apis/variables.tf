variable "project_id" {
  description = "The GCP project ID where the APIs will be enabled"
  type        = string
}

variable "api_services" {
  description = "List of API services to enable"
  type        = list(string)
}
