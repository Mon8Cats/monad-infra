variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

# Workload Identity Pool Variables
variable "pool_id" {
  description = "ID of the Workload Identity Pool"
  type        = string
}

variable "pool_display_name" {
  description = "Display name for the Workload Identity Pool"
  type        = string
  default     = "My Workload Identity Pool"
}

variable "pool_description" {
  description = "Description of the Workload Identity Pool"
  type        = string
  default     = "A pool to authenticate external identities"
}
