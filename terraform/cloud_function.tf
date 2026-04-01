resource "google_storage_bucket" "function_bucket" {
  name          = "${var.project_id}-function-bucket"
  location      = var.region
  force_destroy = true
}

resource "google_storage_bucket_object" "function_archive" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.function_bucket.name6
  source = "${path.module}/cloud_function/function-source.zip"
}

resource "google_cloudfunctions2_function" "visitor_counter" {
  name     = "visitor-counter-v2"
  location = var.region

  build_config {
    runtime     = "python311"
    entry_point = "count_visit"
    source {
      storage_source {
        bucket = google_storage_bucket.function_bucket.name
        object = google_storage_bucket_object.function_archive.name
      }
    }
  }

  service_config {
    available_memory   = "128Mi"
    timeout_seconds    = 60
    max_instance_count = 1
    ingress_settings   = "ALLOW_ALL"
  }

  labels = {
    env = "prod"
  }
}
