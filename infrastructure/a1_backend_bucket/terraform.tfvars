
project_id = "dole-dole"
project_number = "846737158627"
region = "us-central1"

apis  = [
    "storage.googleapis.com",
    # TF sometimes needs to fetch project-level metadata to compare and refresh resources.
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com"
]

bucket_name = "dole-dole" # globally unique name


