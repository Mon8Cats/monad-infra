variable "project_id" {
    description = "Project in which GCP resources to be created"
    type = string
    #default=""
}

variable "region" {
    description = "Region in which GCP resources to be created"
    type = string
    default = "us-central1"
}

variable "environment" {
    description = "Environment variable used as a prefix"
    type = string
    default = "dev"
}

variable "business_division" {
    description = "Business division in the organization"
    type = string
    default = "stric"
}

variable "machine_type" {
    description = "machine type for cluster node"
    type = string
    default = "e2-minium" 
}
