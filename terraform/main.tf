provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "test_creator" {
  name                        = var.bucket_name
  location                    = var.region
  storage_class               = var.storage_class
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age        = var.retention_days
      with_state = "ANY"
    }
    action {
      type = "Delete"
    }
  }
}
