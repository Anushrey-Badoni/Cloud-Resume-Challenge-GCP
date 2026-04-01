provider "google" {
  credentials = file("sa-key.json")
  project     = var.project_id
  region      = var.region
}