// The WorkloadIdentityPoolProvider's display name must be less than or equal to 32 characters.
locals {
  wip_name_unique = "github-pool"
  wip_id = "${local.wip_name_unique}-${var.project_number}"

  pipe_name = "infra"
  sa_id = "sa-${local.pipe_name}"
  log_bucket = "log-${var.project_number}-${local.pipe_name}"
  wip_provider_id = "wip-pid-${local.pipe_name}-${var.project_number}"
  wip_provider_description = "Pool provider for ${var.github_repo_infra}"
  wip_provider_display_name = "wipp-${local.pipe_name}"
  github_acct_repo_infra = "${var.github_account}/${var.github_repo_infra}"
  github_repo_uri_infra = "https://github.com/${local.github_acct_repo_infra}.git"


  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.repository" = "assertion.repository"
    "attribute.job_workflow_ref" = "assertion.job_workflow_ref"
  }
  substitutions = {
    "_PROJECT_ID"     = var.project_id
    "_PROJECT_NUMBER" = var.project_number
    "_REGION"         = var.region
    "_LOG_BUCKET"     = local.log_bucket
  }
}

# the binding is temporary? should do again for every pipeline?
resource "google_secret_manager_secret_iam_member" "cloudbuild_secret_accessor" {
  secret_id = var.secret_id_github
  project   = var.project_id
  role      = "roles/secretmanager.secretAccessor"
  member    =  "serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"

}


module "cicd_pipeline_infra" {
  source = "../../modules/x02_cloudbuild_cicd_pipeline"

  project_id = var.project_id
  project_number = var.project_number
  location = var.region
  api_services = var.api_list
  service_account_id = local.sa_id
  secret_id_github = var.secret_id_github
  log_bucket_name = local.log_bucket
  wip_id = local.wip_id
  wip_provider_id = local.wip_provider_id
  wip_provider_description = local.wip_provider_description
  wip_provider_display_name = local.wip_provider_display_name
  github_account = var.github_account
  repo_name = var.github_repo_infra
  issuer_uri = "https://token.actions.githubusercontent.com"
  attribute_mapping = local.attribute_mapping
  connection_name = var.connection_name_github
}

/*
module "cicd_pipeline_infra" {
  source = "../../modules/g9_cloudbuild_cicd_pipeline_wrapper_new"
  project_id = var.project_id
  region = var.region
  cicd_sa_id = var.cicd_sa_id_infra
  cicd_sa_role_list =  var.cicd_sa_role_list_infra
  cicd_log_bucket = var.cicd_log_bucket_infra
  secret_id_github_token = var.secret_id_github
  wip_name = var.wip_name
  wip_short_id = var.wip_id
  wip_provider_id = local.wip_pid_infra
  github_acct_repo = local.github_acct_repo_infra
  repo_name_gcp = var.github_repo_infra
  repo_uri_remote = local.github_repo_uri_infra
  repo_connection_name = var.repo_connection_name
} 
*/