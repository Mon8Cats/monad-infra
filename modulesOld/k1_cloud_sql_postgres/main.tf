data "google_secret_manager_secret_version" "db_user_secret" {
  project = var.project_id
  secret = var.secret_id_db_user
  version = "latest"
}

data "google_secret_manager_secret_version" "db_password_secret" {
  project = var.project_id
  secret = var.secret_id_db_password
  version = "latest"
}

/*
# Decode secrets
locals {
  db_user     = base64decode(data.google_secret_manager_secret_version.db_user_secret.secret_data)
  db_password = base64decode(data.google_secret_manager_secret_version.db_password_secret.secret_data)
}
*/

resource "google_sql_database_instance" "postgres_instance" {
  name             = var.instance_name
  database_version = var.database_version
  project          = var.project_id
  region           = var.region
  deletion_protection = false
  settings {
    tier            = var.tier
    #tier = "db-custom-2-7680"
    availability_type = var.availability_type
    backup_configuration {
      enabled = true
    }
    ip_configuration {
      ipv4_enabled    = true
      private_network = var.enable_private_ip ? "projects/${var.project_id}/global/networks/${var.vpc_name}" : null

    }
  }
}

resource "google_sql_database" "my_database" {
  name     = var.database_name
  instance = google_sql_database_instance.postgres_instance.name
  project = var.project_id
}

resource "google_sql_user" "db_user" {  
  instance = google_sql_database_instance.postgres_instance.name
  project = var.project_id
  name = data.google_secret_manager_secret_version.db_user_secret.secret_data
  password = data.google_secret_manager_secret_version.db_password_secret.secret_data
  #name     = local.db_user
  #password = local.db_password
}

