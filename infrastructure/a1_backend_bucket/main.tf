

module "service_apis" {
  source                  = "../../modules/a1_service_apis"
  project_id  = var.project_id
  api_services = var.api_list
}

module "terraform_backend_storage_bucket" {
  source                  = "../../modules/b1_storage_bucket"
  project_id              = var.project_id
  location                = "US"
  bucket_name             = var.bucket_name
  storage_class           = "STANDARD"
  force_destroy           = true

  depends_on   = [module.service_apis]
}

