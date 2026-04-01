output "cloud_dns_nameservers" {
  value = google_dns_managed_zone.resume_zone.name_servers
}

output "visitor_function_url" {
  value = google_cloudfunctions2_function.visitor_counter.service_config[0].uri
}