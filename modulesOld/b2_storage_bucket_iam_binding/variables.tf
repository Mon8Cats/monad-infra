variable "bucket_name" {
  description = "The name of the Cloud Storage bucket"
  type        = string
}

variable "service_account_email" {
  description = "The email of the custom service account to grant permissions to"
  type        = string
}

variable "role" {
  description = "The IAM role to assign to the custom service account"
  type        = string
}