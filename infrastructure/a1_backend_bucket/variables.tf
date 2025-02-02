variable "project_id" {
  description = "Project ID for the GCP project"
  type        = string
}

variable "region" {
  description = "Region in which GCP Resources to be created"
  type = string
  #default = "us-central1"
}


variable "api_list" {
  description = "A list of APIs"
  type        = list(string)
}

variable "bucket_name_unique" {
  description = "The bucket for TF backend"
  type        = string
}
