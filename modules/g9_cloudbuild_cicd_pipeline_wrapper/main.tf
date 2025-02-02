/*
- create a service account
- create log bucket
- grant the sa access to the log bucket
- grant the sa access to the github token
- create a wip pool provider
- create a github repository link
- create a cloud build trigger
*/
locals {
  service_account_email = "${var.cicd_sa_id}@${var.project_id}.iam.gserviceaccount.com"
}

module "cicd_service_account" {
  source               = "../../modules/c1_service_account"
  project_id           = var.project_id
  service_account_name = var.cicd_sa_id
  display_name         = "cicd Service Account"
  description          = "This service account is used for CI/CD operations"

  roles = var.cicd_sa_role_list
}


module "cicd_log_bucket" {
  source                  = "../../modules/b1_storage_bucket"
  project_id              = var.project_id
  location                = var.region
  bucket_name             = var.cicd_log_bucket
  storage_class           = "STANDARD"
  force_destroy           = true

  depends_on   = [module.cicd_service_account]
}

module "build_logs_bucket_iam_binding" {
  source           = "../../modules/b2_storage_bucket_iam_binding"
  bucket_name      = var.cicd_log_bucket
  service_account_email   = module.cicd_service_account.service_account_email
  //local.service_account_email
  role             = "roles/storage.objectAdmin"

  depends_on   = [module.cicd_log_bucket]
}


module "github_token_secret_access" {
  source              = "../../modules/e3_secret_iam_member"
  secret_id = var.secret_id_github_token
  service_account_email = module.cicd_service_account.service_account_email

  depends_on   = [module.cicd_service_account]
}


module "db_user_secret_access" {
  source              = "../../modules/e3_secret_iam_member"
  secret_id = var.secret_id_db_user
  service_account_email = module.cicd_service_account.service_account_email

  depends_on   = [module.cicd_service_account]
}


module "secret_id_db_password_secret_access" {
  source              = "../../modules/e3_secret_iam_member"
  secret_id = var.secret_id_db_password
  service_account_email = module.cicd_service_account.service_account_email

  depends_on   = [module.cicd_service_account]
}





module "workload_identity_pool_provider" {
  source = "../../modules/g3_workload_identity_pool_provider"
  project_id   = var.project_id
  # pool id only (no qualified name)
  wip_name = var.wip_name
  wip_short_id = var.wip_short_id
  wip_provider_id= var.wip_provider_id
  github_acct_repo = var.github_acct_repo
  cicd_sa_id = var.cicd_sa_id
}

# repository link
module "gcp_repo_link" {
  source = "../../modules/g5_cloudbuild_repository_link"
  project_id = var.project_id
  region = var.region
  repo_name_gcp = var.repo_name_gcp
  connection_parent = var.repo_connection_name
  repo_uri_remote = var.repo_uri_remote
  build_sa_name = var.cicd_sa_id
}

/*
  location = var.region
  name = var.repo_name_gcp
  parent_connection = var.connection_parent
  remote_uri = var.repo_uri_remote
*/