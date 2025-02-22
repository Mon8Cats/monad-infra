variable "project_id" {
  description = "The GCP project ID where APIs will be enabled"
  type        = string
}

variable "bucket_name" {
  description = "The name of the storage bucket (must be globally unique)"
  type        = string
}

variable "location" {
  description = "The location of the storage bucket (e.g., US, US-CENTRAL1, EUROPE-WEST1)"
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "The storage class of the bucket (e.g., STANDARD, NEARLINE, COLDLINE, ARCHIVE)"
  type        = string
  default     = "STANDARD"
}

variable "force_destroy" {
  description = "Set to true to allow Terraform to delete the bucket without confirmation"
  type        = bool
  default     = true
}

variable "enable_versioning" {
  description = "Enable object versioning in the bucket"
  type        = bool
  default     = true
}

variable "uniform_bucket_level_access" {
  description = "Enables uniform bucket-level access control (recommended for security)"
  type        = bool
  default     = true
}

variable "lifecycle_delete_days" {
  description = "Number of days before objects in the bucket are deleted"
  type        = number
  default     = 30
}

variable "labels" {
  description = "A map of labels to assign to the bucket"
  type        = map(string)
  default     = {}
}
