
locals {
  # Google-managed service agent
  cloud_build_service_account_email = "service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
  
  # Cloud Build default service account
  # ${var.project_number}@cloudbuild.gserviceaccount.com

  wip_name_unique = "github-pool"
  wip_id = "${local.wip_name_unique}-${var.project_number}"

}

module "service_apis" {
  source                  = "../../modules/a01_service_apis"
  project_id  = var.project_id
  apis = var.apis
}


/*
resource "google_project_service" "iam" {
  project = var.project_id
  service = "iam.googleapis.com"
}
*/

module "secret_github_token" {
  source  = "../../modules/b01_secret_manager"
  project_id          = var.project_id
  secret_id         = var.access_token_secret_id
  secret_value = var.access_token_secret_value

  depends_on = [ module.service_apis ]  
}




resource "google_secret_manager_secret_iam_member" "cloudbuild_secret_accessor" {
  secret_id = var.access_token_secret_id
  project   = var.project_id
  role      = "roles/secretmanager.secretAccessor"
  member    =  "serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"

  depends_on = [ module.secret_github_token ]
}


module "github_connection" {
  source = "../../modules/c01_cloud_build_connection"
  project_id               = var.project_id
  location                   = var.region
  app_installation_id = var.app_installation_id_github
  access_token_secret_id = var.access_token_secret_id
  connection_name = var.connection_name_github

  depends_on = [ module.secret_github_token, google_secret_manager_secret_iam_member.cloudbuild_secret_accessor ]
}

module "workload_identity_pool" {
  source = "../../modules/d01_workload_identity_pool"
  project_id   = var.project_id
  pool_id = local.wip_id
  pool_display_name= "github-pool"
  pool_description = "Workload Identity Pool for ${var.project_id}"
}

