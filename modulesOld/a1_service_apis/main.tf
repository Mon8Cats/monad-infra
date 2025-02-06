/*
resource "google_project_service" "cloudresourcemanager" {
  project    = var.project_id
  service    = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

resource "null_resource" "wait_for_cloudresourcemanager" {
  provisioner "local-exec" {
    command = "sleep 30"
  }

  depends_on = [google_project_service.cloudresourcemanager]
}
*/

resource "google_project_service" "enabled_apis" {
  for_each   = toset(var.api_services)
  project    = var.project_id
  service    = each.value  
  disable_on_destroy = false
  disable_dependent_services = false

  #depends_on = [null_resource.wait_for_cloudresourcemanager]
}
