/*
assume a Host Connection is created -> need connection name
assume a Workload Identity Pool is created -> need pool id
then 
create service account
create IAM binding for necessary roles
create log bucket
create IAM binding (sa - log bucket)
create workload identity pool provider
create IAM binding (sa - workload identity)
create linked repo
create cloudbuild trigger

*/

locals {
  cloud_build_service_account_email = "service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com" 
  service_account_email = "${var.service_account_id}@${var.project_id}.iam.gserviceaccount.com"
}


resource "google_project_service" "enabled_apis" {
  for_each   = toset(var.api_services)
  project    = var.project_id
  service    = each.value  
  disable_on_destroy = false
  disable_dependent_services = false

}

resource "google_service_account" "cicd_service_accounts" {
  account_id   = var.service_account_id
  display_name = "CI/CD Service Account"
  project      = var.project_id
}

resource "google_secret_manager_secret_iam_binding" "github_token_access" {
  project   = var.project_id
  secret_id = var.secret_id_github
  role      = "roles/secretmanager.secretAccessor"

  members = [
    "serviceAccount:${local.service_account_email}"
  ]
}

resource "google_storage_bucket" "my_bucket" {
  name          = var.log_bucket_name
  project       = var.project_id
  location      = "US"
  storage_class = "STANDARD"    #var.storage_class
  force_destroy = true # var.force_destroy

  lifecycle {
    prevent_destroy = false
  }

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = var.log_bucket_name
  role   = "roles/storage.objectAdmin"

  members = [
    "serviceAccount:${local.service_account_email}"
  ]
}


resource "google_iam_workload_identity_pool_provider" "github_provider" {
  provider     = google
  project      = var.project_id
  workload_identity_pool_id = var.wip_id
  workload_identity_pool_provider_id = var.wip_provider_id

  display_name = var.wip_provider_display_name
  description  = var.wip_provider_description

  oidc {
    issuer_uri = var.issuer_uri
  }

  attribute_mapping = var.attribute_mapping
  attribute_condition = "assertion.repository == \"${var.github_account}/${var.repo_name}\""
}

resource "google_service_account_iam_binding" "workload_identity_bindings" {
  service_account_id = google_service_account.cicd_service_account.name 
  # "projects/${var.project_id}/serviceAccounts/${var.service_account_email}"
  role  = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/${var.wip_id}/attribute.repository/${var.github_account}/${var.repo_name}"
  ]
}



resource "google_cloudbuild_trigger" "github_trigger" {
  name     = "github-trigger-${var.repo_name}"
  project  = var.project_id
  location = var.location

  service_account = google_service_account.cicd_service_account.email

  source_to_build {
    repository = "projects/${var.project_id}/locations/${var.location}/connections/${var.connection_name}/repositories/${var.repo_name}"
    ref        = "refs/heads/${var.branch_name}"
    repo_type = var.repo_type
  }

  filename = "cloudbuild.yaml"  # Cloud Build config file in the repo

  included_files = ["**/*"]  # Monitor all files for changes

  github {
    owner = var.github_account
    name  = var.repo_name
    push {
      branch = "^${var.branch_name}$"  # Regex for branch name
    }
  }

  substitutions = var.substitutions  # Pass build-time environment variables
}


# service account IAM binding : Secret Manager (github token), WIP provider
#included_files = ["**/*"]  # Monitor all files for changes


/*
resource "google_cloudbuild_trigger" "github_trigger" {
  project         = var.project_id
  location        = var.location
  name            = "github-trigger"
  description     = "Trigger build on push to the linked GitHub repo"
  service_account = google_service_account.cicd_service_account.email


  github {
    owner        = var.github_account
    name         = var.repo_name
    push {
      branch = "main"
    }
  }


  trigger_template {
    repo_name   = google_cloudbuildv2_repository.my_repository.name
    branch_name = "main"
    
  }

  filename    = "cloudbuild.yaml"
}
*/