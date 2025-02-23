

module "service_apis" {
  source                  = "../../modules/a01_service_apis"
  project_id  = var.project_id
  apis = var.apis
}

module "terraform_backend_storage_bucket" {
  source                  = "../../modules/a02_storage_bucket"
  project_id              = var.project_id
  location                = "US"
  bucket_name             = var.bucket_name
  storage_class           = "STANDARD"
  force_destroy           = true

  depends_on   = [module.service_apis]
}
