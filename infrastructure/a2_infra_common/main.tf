/*
- enable apis



*/

locals {
  # Google-managed service agent
  cloud_build_service_account_email = "service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
  
  # Cloud Build default service account
  # ${var.project_number}@cloudbuild.gserviceaccount.com

  wip_name_unique = "wip"
  wip_id = "${local.wip_name_unique}-${var.project_number}"

}


module "service_apis" {
  source                  = "../../modules/a1_service_apis"
  project_id  = var.project_id
  api_services = var.api_list
}

resource "google_project_service" "iam" {
  project = var.project_id
  service = "iam.googleapis.com"
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


module "github_connection" {
  source = "../../modules/g1_cloudbuild_github_connection"
  project_id               = var.project_id
  region                   = var.region
  app_installation_id_github = var.app_installation_id_github
  secret_id_github = var.secret_id_github
  connection_name_github = var.connection_name_github

  depends_on = [ module.secret_manager_wrapper ]
}

module "workload_identity_pool" {
  source = "../../modules/g2_workload_identity_pool"
  project_id   = var.project_id
  wi_pool_id = local.wip_id
  wi_pool_name= local.wip_name_unique
}

