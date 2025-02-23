
module "service_apis" {
  source                  = "../../modules/a01_service_apis"
  project_id  = var.project_id
  apis = var.apis
}


module "terraform_service_account" {
  source                  = "../../modules/a03_service_account"
  project_id              = var.project_id
  service_account_id    = var.service_account_id
  service_account_display_name = var.service_account_display_name

  depends_on   = [module.service_apis]
}

module "iam_role_binding" {
  source                = "../../modules/a04_sa_iam_binding"
  project_id            = var.project_id
  service_account_email = module.terraform_service_account.service_account_email
  roles                 = [
    "roles/secretmanager.secretAccessor",
    "roles/cloudbuild.builds.editor",
    "roles/iam.serviceAccountUser"
  ]

  depends_on = [ module.terraform_service_account ]
}