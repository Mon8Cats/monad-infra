output "bucket_name" {
  description = "The name of the created storage bucket"
  value       = google_storage_bucket.bucket.name
}

output "bucket_url" {
  description = "The public URL of the storage bucket"
  value       = "https://console.cloud.google.com/storage/browser/${google_storage_bucket.bucket.name}"
}
