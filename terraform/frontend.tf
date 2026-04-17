resource "google_storage_bucket" "resume_bucket" {
  name     = var.bucket_name
  location = var.region
  website {
    main_page_suffix = "index.html"
  }
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_binding" "public_access" {
  bucket = google_storage_bucket.resume_bucket.name
  role   = "roles/storage.objectViewer"
  members = [
    "allUsers"
  ]
}

resource "google_storage_bucket_object" "files" {
  for_each = toset(
    concat(
      tolist(fileset("../frontend", "*.html"))
    )
  )
  name     = each.value
  source   = "../frontend/${each.value}"
  bucket   = google_storage_bucket.resume_bucket.name
  content_type = lookup({
    html = "text/html"
  }, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")
}