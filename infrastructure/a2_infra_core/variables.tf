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

variable "service_account_id" {
  description = "The account ID for the service account to create. This must be unique within the project."
  type        = string
}

variable "service_account_display_name" {
  description = "The display name for the service account."
  type        = string
}

variable "service_account_roles" {
  description = "A list of service account roles"
  type        = list(string)
}