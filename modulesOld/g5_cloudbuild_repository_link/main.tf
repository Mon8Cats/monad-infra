resource "google_cloudbuildv2_repository" "my_repository" {
  location = var.region
  name = var.repo_name_gcp
  parent_connection = var.connection_parent
  remote_uri = var.repo_uri_remote
}

resource "google_cloudbuild_trigger" "repo_trigger" {
  name        = "repo-trigger"
  location    = var.region
  project     = var.project_id
  service_account = "${var.build_sa_name}@${var.project_id}.iam.gserviceaccount.com"
  filename    = "cloudbuild.yaml"

  repository_event_config {
    repository = google_cloudbuildv2_repository.my_repository.name
    #filter = "refs/heads/*"
    #repository_type = "GITHUB" 
    /*
    push {
      branch = ".*"
    }
    */
  }

  source_to_build {

    repo_type = "GITHUB"

    uri = "https://github.com/mon8cats/"

    ref = "refs/heads/main"

  }
}


/*
resource "google_cloudbuild_trigger" "repo-trigger" {
  name        = "repo-trigger"
  location    = var.region
  project     = var.project_id
  service_account = "${var.build_sa_name}@${var.project_id}.iam.gserviceaccount.com"
  filename    = "cloudbuild.yaml"

  repository_event_config {
    repository = "projects/${var.project_id}/locations/${var.region}/connections/github-connection/repositories/${var.repo_name_gcp}"

    push {
      branch = "^main$" # Adjust to .* temporarily if needed
    }
  }
}

*/
/*
resource "google_cloudbuild_trigger" "repo-trigger" {
  location = var.region

  repository_event_config {
    repository = google_cloudbuildv2_repository.my_repository.id
    push {
      branch = "^main$"
    }
  }

  filename = "cloudbuild.yaml"
  service_account = "${var.build_sa_name}@${var.project_id}.iam.gserviceaccount.com"
}
*/


/* code from terraform registry


resource "google_cloudbuildv2_connection" "my-connection" {
  location = "us-central1"
  name = "my-connection"

  github_config {
    app_installation_id = 123123
    authorizer_credential {
      oauth_token_secret_version = "projects/my-project/secrets/github-pat-secret/versions/latest"
    }
  }
}

resource "google_cloudbuildv2_repository" "my-repository" {
  name = "my-repo"
  parent_connection = google_cloudbuildv2_connection.my-connection.id
  remote_uri = "https://github.com/myuser/my-repo.git"
}

resource "google_cloudbuild_trigger" "repo-trigger" {
  location = "us-central1"

  repository_event_config {
    repository = google_cloudbuildv2_repository.my-repository.id
    push {
      branch = "feature-.*"
    }
  }

  filename = "cloudbuild.yaml"
}

*/