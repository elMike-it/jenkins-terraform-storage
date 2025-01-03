output "bucket_name" {
  description = "Nombre del bucket creado"
  value       = google_storage_bucket.test_bucket.name
}

output "bucket_location" {
  description = "Región del bucket creado"
  value       = google_storage_bucket.test_bucket.location
}
