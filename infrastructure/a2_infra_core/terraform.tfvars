
project_id = "dole-dole"
project_number = "205875226727"
region = "us-central1"

apis  = [
    "storage.googleapis.com",
    # TF sometimes needs to fetch project-level metadata to compare and refresh resources.
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com"
]

service_account_id = "sa-terraform" # 6-30 characters
service_account_display_name = "Terraform Service Account"
service_account_roles = [ 
    "roles/secretmanager.secretAccessor",
    "roles/cloudbuild.builds.editor",
    "roles/iam.serviceAccountUser"
]