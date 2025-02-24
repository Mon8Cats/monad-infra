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


# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "prod"
}

# Business Division
variable "business_division" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "appdev"
}

# CIDR IP Ranges
variable "subnet_ip_range" {
  description = "Subnet IP range"
  type = string
  default = "10.139.0.0/20"
}

variable "pods_ip_range" {
  description = "Kubernetes Pods IP range"
  type = string
  default = "10.11.0.0/21"
}

variable "services_ip_range" {
  description = "Kubernetes Services IP range"
  type = string
  default = "10.22.0.0/21"
}

variable "master_ip_range" {
  description = "Kubernetes Master IP range"
  type = string
  default = "10.33.0.0/28"
}
