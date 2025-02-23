
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
  roles                 = var.service_account_roles

  depends_on = [ module.terraform_service_account ]
}

# custom role for Cloud Build connection creator
resource "google_project_iam_custom_role" "cloudbuild_connection_creator" {
  role_id     = "CloudBuildConnectionCreator"
  title       = "Cloud Build Connection Creator"
  description = "Custom role to allow creating Cloud Build connections"
  project     = var.project_id

  permissions = [
    "cloudbuild.connections.create",
    "cloudbuild.connections.get",
    "cloudbuild.connections.update",
  ]
}

# grant the custom role to the Cloud Build service account
resource "google_project_iam_member" "custom_cloudbuild_connection_binding" {
  project = var.project_id
  role    = google_project_iam_custom_role.cloudbuild_connection_creator.name
  member  = "serviceAccount:${module.terraform_service_account.service_account_email}"

  depends_on = [ module.terraform_service_account, google_project_iam_custom_role.cloudbuild_connection_creator ]
}


resource "google_project_iam_custom_role" "storage_iam_updater" {
  role_id     = "StorageIamUpdater"
  title       = "Storage IAM Updater"
  description = "Custom role to allow updating storage bucket IAM policies"
  project     = var.project_id

  permissions = [
    "storage.buckets.getIamPolicy",
    "storage.buckets.setIamPolicy",
  ]
}

resource "google_project_iam_member" "custom_storage_iam_updater_binding" {
  project = var.project_id
  role    = google_project_iam_custom_role.storage_iam_updater.name
  member  = "serviceAccount:${module.terraform_service_account.service_account_email}"

  depends_on = [ module.terraform_service_account, google_project_iam_custom_role.storage_iam_updater ]
}


resource "google_project_iam_custom_role" "cloudbuild_repo_creator" {
  role_id     = "CloudBuildRepoCreator"
  title       = "Cloud Build Repository Creator"
  description = "Custom role to allow creating Cloud Build repositories"
  project     = var.project_id

  permissions = [
    "cloudbuild.repositories.create",
    "cloudbuild.repositories.get",
    "cloudbuild.repositories.list",
    "cloudbuild.repositories.update",
    "cloudbuild.repositories.delete",
  ]
}

resource "google_project_iam_member" "custom_cloudbuild_repo_binding" {
  project = var.project_id
  role    = google_project_iam_custom_role.cloudbuild_repo_creator.name
  member  = "serviceAccount:${module.terraform_service_account.service_account_email}"

  depends_on = [ module.terraform_service_account, google_project_iam_custom_role.cloudbuild_repo_creator ]
}
