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

variable "bucket_name" {
  description = "The bucket for TF backend"
  type        = string
}
