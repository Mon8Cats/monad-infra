locals {
  #cicd_sa_email = "${var.cicd_sa_id}@${var.project_id}.iam.gserviceaccount.com"
  cicd_sa_email = "projects/${var.project_id}/serviceAccounts/${var.cicd_sa_id}@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_iam_workload_identity_pool_provider" "github_provider" {
  provider = google #google-beta
  project  = var.project_id 
  workload_identity_pool_id         = var.wip_short_id
  workload_identity_pool_provider_id = var.wip_provider_id #short id?
  display_name                      = "WI Pool Provider"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
  }

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }

  # Specify the condition to match GitHub's repository claim
  attribute_condition = "attribute.repository == '${var.github_acct_repo}'"

}

resource "google_service_account_iam_member" "workload_identity_binding" {
  service_account_id = local.cicd_sa_email
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${var.wip_name}/attribute.repository/${var.github_acct_repo}"
}