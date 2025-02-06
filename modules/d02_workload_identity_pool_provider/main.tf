resource "google_iam_workload_identity_pool_provider" "my_provider" {
  provider     = google
  project      = var.project_id
  workload_identity_pool_id = var.workload_identity_pool_id
  workload_identity_pool_provider_id = var.provider_id

  display_name = var.provider_display_name
  description  = var.provider_description

  attribute_mapping = var.attribute_mapping

  oidc {
    issuer_uri = var.issuer_uri
  }
}

