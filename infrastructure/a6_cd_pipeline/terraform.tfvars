project_id = "dole-dole"
project_number = "846737158627"
region = "us-central1"
#credentials_file  = "/home/mon8cats3/credentials/sa-terraform.json"

api_list  = [
    "cloudresourcemanager.googleapis.com",
    "secretmanager.googleapis.com", 
    "storage.googleapis.com",
    "cloudbuild.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "compute.googleapis.com",
    "sqladmin.googleapis.com"
]


secret_id_github = "github-token"
#secret_data_github = "github-token-value"
#secret_data_db_password = "db-password"

connection_name_github = "github-connection"
app_installation_id_github = "55957239" 
github_account = "Mon8Cats"

cicd_sa_id_infra = "sa-cicd-infra"
cicd_log_bucket_infra = "spn-run-infra-logs" # infra: cloudbuild.yaml
github_repo_infra = "cog-run-infra"
repo_name_gcp_infra = "cog-run-infra"

cicd_sa_role_list_infra = [
  "roles/cloudbuild.builds.editor",
  "roles/storage.admin", 
  "roles/storage.objectViewer",  #"roles/storage.objectAdmin",
  "roles/secretmanager.secretAccessor",
  "roles/iam.serviceAccountUser",
  "roles/iam.serviceAccountAdmin", # Add this role
  "roles/resourcemanager.projectIamAdmin",
  "roles/viewer",
  "roles/compute.admin",
  "roles/iam.serviceAccountKeyAdmin",
  "roles/source.reader",
  "roles/cloudbuild.builds.builder",
  "roles/artifactregistry.admin",
  "roles/cloudsql.admin",
  "roles/compute.networkAdmin",
  "roles/compute.securityAdmin"
]

