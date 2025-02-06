locals {
  # Google-managed service agent
  cloud_build_service_account_email = "service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
  
  # Cloud Build default service account
  # ${var.project_number}@cloudbuild.gserviceaccount.com
}


module "secret_github_token" {
  source  = "../e1_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_github
  secret_data = var.secret_data_github
}

module "github_token_secret_access_cloud_build_sa" {
  source  = "../e3_secret_iam_member"
  secret_id = var.secret_id_github
  service_account_email = local.cloud_build_service_account_email

  depends_on = [ module.secret_github_token ]
}

module "secret_db_user" {
  source              =   "../e1_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_db_user
  secret_data = var.secret_data_db_user
}

/*
resource "random_password" "db_password" {
  length  = 16
  special = true
}
*/

module "secret_db_password" {
  source              =   "../e1_secret_manager"
  project_id          = var.project_id
  secret_id         = var.secret_id_db_password
  secret_data = var.secret_data_db_password
  #secret_data = random_password.db_password.result
}

