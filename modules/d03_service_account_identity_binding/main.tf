/*
module "cloudrun_sa_binding" {
  source = "./modules/workload_identity_binding"

  service_account_id = "projects/my-gcp-project/serviceAccounts/cloudrun-sa@my-gcp-project.iam.gserviceaccount.com"
  role              = "roles/iam.workloadIdentityUser"

  members = [
    "principalSet://iam.googleapis.com/projects/123456789/locations/global/workloadIdentityPools/github-ci-pool/attribute.repository/mygithubuser/repo2"
  ]
}
*/


resource "google_service_account_iam_binding" "binding" {
  service_account_id = var.service_account_id
  role              = var.role
  members           = var.members
}