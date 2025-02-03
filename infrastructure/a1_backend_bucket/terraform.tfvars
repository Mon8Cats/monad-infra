
project_id = "cata-morph"
project_number = "205875226727"
region = "us-central1"

api_list  = [
    "cloudresourcemanager.googleapis.com", # enable this first
    "secretmanager.googleapis.com", 
    "storage.googleapis.com",
]

bucket_name_unique = "cata-morph-gke" # globally unique name
