
project_id = "dole-dole"
project_number = "846737158627"
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
    "roles/secretmanager.admin", # secretAcccessor, secretCreator
    # not project leve
    #"roles/cloudbuild.admin", # cloudbuild.builds.builder, cloudbuild.connections.create
    #"roles/cloudbuild.connections.create", # permission not a role
    "roles/cloudbuild.builds.builder",
    "roles/iam.serviceAccountUser",
    "roles/serviceusage.serviceUsageAdmin", # serviceUsageConsumer",
    "roles/iam.workloadIdentityPoolAdmin",
]