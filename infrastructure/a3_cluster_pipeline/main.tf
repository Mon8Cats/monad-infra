
locals {
  wip_name_unique = "wip"
  wip_id = "${local.wip_name_unique}-${var.project_number}"
  wip_pid_infra =  "${local.wip_name_unique}-pid-infra-${var.project_number}"
  github_acct_repo_infra = "${var.github_account}/${var.github_repo_infra}"
  github_repo_uri_infra = "https://github.com/${local.github_acct_repo_infra}.git"
}


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