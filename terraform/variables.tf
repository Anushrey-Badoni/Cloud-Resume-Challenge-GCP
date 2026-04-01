variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "asia-south1"
}

variable "bucket_name" {
  type        = string
  description = "Name of the GCS bucket"
}

variable "location" {
  type        = string
  default     = "US"
}
