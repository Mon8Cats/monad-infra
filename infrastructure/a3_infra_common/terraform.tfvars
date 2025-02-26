project_id = "dole-dole"
project_number = "846737158627"
region = "us-central1"
credentials_file  = "/home/mon8cats3/credentials/sa-terraform.json"
sa-terraform = "sa-terraform"

apis  = [
    "cloudresourcemanager.googleapis.com",
    "secretmanager.googleapis.com", 
    "storage.googleapis.com",
    "cloudbuild.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "compute.googleapis.com",
]


access_token_secret_id = "github-access-token"
access_token_secret_value = ""

connection_name_github = "github-connection"
app_installation_id_github = "55957239" 
github_account = "Mon8Cats"