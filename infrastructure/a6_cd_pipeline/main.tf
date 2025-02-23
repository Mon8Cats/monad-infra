
locals {
  wip_name_unique = "wip"
  wip_id = "${local.wip_name_unique}-${var.project_number}"

  #
  //wi_pool_provider_id_infra = "${local.wi_pool_name_unique}-prid-infra-${var.project_number}"
  wip_pid_infra =  "${local.wip_name_unique}-pid-infra-${var.project_number}"
  github_acct_repo_infra = "${var.github_account}/${var.github_repo_infra}"
  github_repo_uri_infra = "https://github.com/${local.github_acct_repo_infra}.git"
  #cicd_sa_email_infra = "${var.cicd_sa_id_infra}@${var.project_id}.iam.gserviceaccount.com" 
  #
  //wi_pool_provider_id_app = "${local.wi_pool_name_unique}-prid-app-${var.project_number}"

}


module "cicd_pipeline_infra" {
  source = "../../modules/g9_cloudbuild_cicd_pipeline_wrapper_new"
  project_id = var.project_id
  region = var.region
  cicd_sa_id = var.cicd_sa_id_infra
  cicd_sa_role_list =  var.cicd_sa_role_list_infra
  cicd_log_bucket = var.cicd_log_bucket_infra
  #
  secret_id_github_token = var.secret_id_github
  #secret_id_db_user = "" #var.secret_id_db_user
  #secret_id_db_password = "" # var.secret_id_db_password
  #
  wip_name = module.workload_identity_pool.wip_name
  wip_short_id = module.workload_identity_pool.wip_short_id
  wip_provider_id = local.wip_pid_infra
  #wip_provider_display_name = "wip-infra"
  github_acct_repo = local.github_acct_repo_infra
  #
  repo_name_gcp = var.github_repo_infra
  repo_uri_remote = local.github_repo_uri_infra
  repo_connection_name = module.github_connection.connection_name
} 