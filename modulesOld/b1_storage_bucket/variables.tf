variable "project_id" {
  description = "The GCP project ID where the bucket will be created"
  type        = string
}

variable "location" {
  description = "Location of the bucket (e.g., US, US-CENTRAL1)"
  type        = string
  default     = "US"
}

variable "bucket_name" {
  description = "Name of the GCS bucket to create"
  type        = string
}

variable "storage_class" {
  description = "The storage class of the bucket (e.g., STANDARD, NEARLINE, COLDLINE, ARCHIVE)"
  type        = string
  default     = "STANDARD"
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket (delete even if it contains objects)"
  type        = bool
  default     = true
}