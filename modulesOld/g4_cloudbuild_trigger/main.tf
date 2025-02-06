

resource "google_cloudbuild_trigger" "my_trigger" {
  name        = "my-cloudbuild-trigger"
  description = "Trigger using cloudbuild.yaml"

  git_file_source {
    path = ""
    uri = ""
    revision = ""
    repo_type = "GITHUB"
  }
}
  # Event to listen for - in this case, a push to a branch
  /*
  event {
    type = "PUSH"
    push {
      branch = "^main$" # Replace with your branch name or regex
    }
  }
  */

  /*
  # Source repository configuration
  source_to_build {
    uri=""
    ref = "refs/heads/main"
    repo_type = "GITHUB"
    /*
    git_repo {
      uri = ""
      ref = ""
      repo_type= ""
      connection = ""
    }
    
    ref = ""
    repo_type = ""
    repository = ""
    
    repository {
      name       = "projects/your-project-id/locations/us-central1/connections/your-connection-name/repositories/your-repo-name"
      dir        = "." # Directory containing your cloudbuild.yaml file
      #branch_ref = "refs/heads/main" # Replace with the appropriate branch reference
      ref = " aa"
      repo_type = "aa"
    }
    
  }

  # No explicit build steps here; Cloud Build will use your cloudbuild.yaml file
  filename = "cloudbuild.yaml" # Path to your cloudbuild.yaml file relative to the repository root

  # Specify the service account for the build
  service_account = "cloud-build-sa@your-project-id.iam.gserviceaccount.com"
}


/*
resource "google_cloudbuildv2_repository" "my_repository" {
  location = var.region
  name = var.repo_name_gcp
  parent_connection = var.connection_parent
  remote_uri = var.repo_uri_remote
}


resource "google_cloudbuildv2_trigger" "my_trigger" {
  location = google_cloudbuildv2_repository.my_repository.location

  repository_event_config {
    repository = google_cloudbuildv2_repository.my_repository.name
    push {
      branches = ["main"] # Or other branches as needed
    }
  }

  filename = "cloudbuild.yaml" 
}


resource "google_cloudbuild_trigger" "trigger" {
  project  = var.project_id
  name     = var.trigger_name
  #region   = var.region
  description = "Trigger to build and deploy using Cloud Build"
  filename = var.cloudbuild_yaml_path
  service_account = var.service_account_email
  #included_files = ["**"]
  ignored_files  = []
  disabled = false
  github {
    name       = google_cloudbuildv2_repository.my_repository.name
    owner      = var.github_account
    push {
      branch = var.branch_regex
    }
  }
}
*/